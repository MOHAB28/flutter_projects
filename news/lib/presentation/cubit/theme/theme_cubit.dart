import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/themes/app_theme.dart'; // سنقوم بإنشائه لاحقاً
import 'theme_state.dart';

const String _themePrefKey = 'appTheme';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(
        ThemeState(
          themeData: AppTheme.lightThemeMode,
          themeMode: ThemeMode.light,
        ),
      ) {
    _loadTheme();
  }

  void toggleTheme() async {
    final newThemeMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final newThemeData =
        newThemeMode == ThemeMode.light
            ? AppTheme.lightThemeMode
            : AppTheme.darkThemeMode;
    emit(ThemeState(themeData: newThemeData, themeMode: newThemeMode));
    _saveTheme(newThemeMode);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString =
        prefs.getString(_themePrefKey) ?? ThemeMode.light.toString();
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.toString() == themeString,
      orElse: () => ThemeMode.light,
    );
    final themeData =
        themeMode == ThemeMode.light
            ? AppTheme.lightThemeMode
            : AppTheme.darkThemeMode;
    emit(ThemeState(themeData: themeData, themeMode: themeMode));
  }

  Future<void> _saveTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themePrefKey, themeMode.toString());
  }
}
