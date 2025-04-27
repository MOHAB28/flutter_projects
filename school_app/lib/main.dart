import 'package:flutter/material.dart';
import 'package:school_app/core/utils/app_colors.dart';
import 'package:school_app/core/utils/text_styles.dart';
import 'package:school_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutesNames.initial,
      routes: AppRoutesNames.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: AppFonts.openSans,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blue,
          titleTextStyle: AppFontStyles.appBarTextStyle,
        ),
      ),
      //
    );
  }
}
