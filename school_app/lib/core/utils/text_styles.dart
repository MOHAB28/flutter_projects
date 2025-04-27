import 'package:flutter/widgets.dart';
import 'package:school_app/core/utils/app_colors.dart';

class AppFonts {
  static const String openSans = 'OpenSans';
}

class AppFontWeights {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}

class AppFontStyles {
  static const TextStyle appBarTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 20.0,
    fontWeight: AppFontWeights.bold,
    fontFamily: AppFonts.openSans,
  );

  static const TextStyle buttonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 18.0,
    fontFamily: AppFonts.openSans,
    fontWeight: AppFontWeights.medium,
  );

  static const TextStyle headline1 = TextStyle(
    color: AppColors.primaryText,
    fontSize: 30.0,
    fontFamily: AppFonts.openSans,
    fontWeight: AppFontWeights.bold,
  );
}
