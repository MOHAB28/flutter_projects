import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;

  SharedPreferences get sharedPreferencesIntance =>
      Provider.of<SharedPreferences>(this, listen: false);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
