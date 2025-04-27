import 'package:school_app/domain/models/person/person_model.dart';

class StudentModel extends PersonModel {
  final int level;
  const StudentModel({
    required this.level,
    required super.fullName,
    required super.phoneNumber,
    required super.address,
    required super.subjects,
    required super.sections,
  });
}
