import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'presentation/cubit/theme/theme_cubit.dart';
import 'presentation/cubit/theme/theme_state.dart';
import 'presentation/cubit/localization/localization_cubit.dart';
import 'presentation/cubit/localization/localization_state.dart';
import 'presentation/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LocalizationCubit()),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, localizationState) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                title:
                    'News App', // سيتم استبداله بالترجمة لاحقاً إذا لزم الأمر
                theme: themeState.themeData,
                themeMode: themeState.themeMode,
                locale: localizationState.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                home: const HomeScreen(),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
