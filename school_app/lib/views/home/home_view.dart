import 'package:flutter/material.dart';

import 'package:school_app/core/enums/user_type.dart';
import 'package:school_app/core/utils/app_colors.dart';
import 'package:school_app/domain/models/student/student_model.dart';
import 'package:school_app/domain/models/subject/subject_model.dart';
import 'package:school_app/domain/models/teacher/teacher_model.dart';

class HomeView extends StatelessWidget {
  final UserType userType;
  final TeacherModel teacher;
  final StudentModel student;

  const HomeView({
    super.key,
    required this.userType,
    required this.teacher,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Future School'), //
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            child: CircleAvatar(
              backgroundColor: AppColors.accentColor, //
              child: Icon(Icons.person), //
            ),
          ),
        ),
        body:
            userType == UserType.teacher
                ? ListView.separated(
                  padding: const EdgeInsets.all(20.0),
                  itemCount: teacher.sections.length, //
                  separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                  itemBuilder: (context, index) {
                    Section section = teacher.sections[index];
                    return Card(
                      color: AppColors.accentColor,
                      child: ListTile(
                        title: Text(section.name), //
                        trailing: Icon(
                          Icons.arrow_forward_ios, //
                          size: 20.0,
                        ),
                      ), //
                    );
                  },
                )
                : const SizedBox(),
        //
      ),
    );
  }
}
