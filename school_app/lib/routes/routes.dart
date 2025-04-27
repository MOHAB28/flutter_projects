import 'dart:math';

import 'package:flutter/material.dart';
import 'package:school_app/domain/models/student/student_model.dart';
import 'package:school_app/domain/models/subject/subject_model.dart';
import 'package:school_app/domain/models/teacher/teacher_model.dart';
import 'package:school_app/views/home/home_view.dart';
import 'package:school_app/views/profile/profile_view.dart';
import 'package:school_app/views/splash_view/splash_view.dart';
import 'package:school_app/views/welcome/welcome_view.dart';

List<Section> sections = List.generate(20, (index) {
  return Section(
    name: 'Section ${index + 1} - ${index % 2 == 0 ? 'Arabic' : 'Math'}',
    date: DateTime(2025, 5, 13).add(Duration(days: Random().nextInt(5) + 1)),
    labName: 'Lab ${Random().nextInt(5) + 1}',
    phoneNumberOfStudent: Random().nextInt(50) + 20,
  );
});

TeacherModel _teacherModel = TeacherModel(
  fullName: 'Mohammed Salah',
  phoneNumber: '01083947846',
  address: 'Egypt, Gharbia, Mahalla',
  subjects: ['Aranic', 'Math'],
  yearsOfExperience: 3, //
  sections: sections, //
);

StudentModel _student = StudentModel(
  level: 2,
  fullName: 'Mohammed Hassan',
  phoneNumber: '01173897363',
  address: 'Egypt, Dakahlia, Mansoura',
  subjects: ['Arabic', 'Math'],
  sections: sections, //
);

class AppRoutesNames {
  static const String initial = '/';
  static const String homeView = '/Home-View';
  static const String welcomeView = '/Welcome-View';
  static const String profileView = '/Profile-View';
  static const String sectionDetailsView = '/Section-Details-View';

  static Map<String, WidgetBuilder> routes = {
    initial: (_) => const SplashView(),
    welcomeView:
        (_) => WelcomveView(
          teacher: _teacherModel,
          studentModel: _student, //
        ),
    profileView: (_) => const ProfileView(),
    homeView: (context) {
      Map<String, dynamic> data =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return HomeView(
        userType: data['userType'], //
        student: data['student'],
        teacher: data['teacher'],
      );
    },
  };
}
