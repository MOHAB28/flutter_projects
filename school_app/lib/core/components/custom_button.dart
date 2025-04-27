import 'package:flutter/material.dart';
import 'package:school_app/core/utils/app_colors.dart';
import 'package:school_app/core/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.0,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.blue, //
          borderRadius: BorderRadius.all(Radius.circular(8.0)), //
        ),
        child: Center(
          child: Text(
            title,
            style: AppFontStyles.buttonTitle,
            //
          ), //
        ),
      ),
    );
  }
}
