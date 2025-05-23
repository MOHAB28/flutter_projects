import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/theme/theme_cubit.dart';
import '../cubit/localization/localization_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final localizationCubit = context.watch<LocalizationCubit>();
    final currentLocale = localizationCubit.state.locale;
    final isDarkMode = themeCubit.state.themeMode == ThemeMode.dark;
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // --- Language Setting ---
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(localizations.language),
            trailing: DropdownButton<String>(
              value: currentLocale.languageCode,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'ar', child: Text('العربية')),
              ],
              onChanged: (String? newLang) {
                if (newLang != null) {
                  localizationCubit.changeLanguage(newLang);
                }
              },
            ),
          ),
          const Divider(),

          // --- Theme Setting ---
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: Text(localizations.theme),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (_) {
                themeCubit.toggleTheme();
              },
            ),
            subtitle: Text(
              isDarkMode ? localizations.darkMode : localizations.lightMode,
            ),
          ),
          const Divider(),

          // يمكنك إضافة إعدادات أخرى هنا
        ],
      ),
    );
  }
}
