import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[850],
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.blueGrey[300],
    unselectedItemColor: Colors.grey[600],
    backgroundColor: Colors.grey[850],
  ),
  // يمكنك إضافة المزيد من تخصيصات السمة هنا
);
