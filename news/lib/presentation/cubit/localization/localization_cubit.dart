import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'localization_state.dart';

const String _localePrefKey = 'appLocale';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const LocalizationState(locale: Locale('en'))) { // الافتراضي هو الإنجليزية
    _loadLocale();
  }

  void changeLanguage(String languageCode) async {
    final newLocale = Locale(languageCode);
    emit(LocalizationState(locale: newLocale));
    _saveLocale(languageCode);
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localePrefKey) ?? 'en';
    emit(LocalizationState(locale: Locale(languageCode)));
  }

  Future<void> _saveLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localePrefKey, languageCode);
  }
}
