import 'package:school_app/domain/models/person/person_model.dart';

class TeacherModel extends PersonModel {
  final int yearsOfExperience;

  const TeacherModel({
    required super.fullName,
    required super.phoneNumber,
    required super.address,
    required super.subjects,
    required super.sections,
    required this.yearsOfExperience,
  });
}
