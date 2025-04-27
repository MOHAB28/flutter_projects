// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:school_app/core/components/custom_button.dart';
import 'package:school_app/core/enums/user_type.dart';
import 'package:school_app/core/utils/text_styles.dart';
import 'package:school_app/domain/models/student/student_model.dart';
import 'package:school_app/domain/models/teacher/teacher_model.dart';
import 'package:school_app/routes/routes.dart';

class WelcomveView extends StatelessWidget {
  final TeacherModel teacher;
  final StudentModel studentModel;
  const WelcomveView({
    super.key,
    required this.teacher,
    required this.studentModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Welcome',
                style: AppFontStyles.headline1, //
              ),
              const Spacer(),
              CustomButton(
                title: 'I am a Teacher',
                onTap: () {
                  _navigateToHome(context, UserType.teacher);
                }, //
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                title: 'I am a Student',
                onTap: () {
                  _navigateToHome(context, UserType.student);
                }, //
              ),
              const Spacer(), //
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context, UserType userType) {
    Navigator.pushReplacementNamed(
      context,
      AppRoutesNames.homeView,
      arguments: {
        'teacher': teacher,
        'student': studentModel,
        'userType': userType,
      }, //
    );
  }
}
