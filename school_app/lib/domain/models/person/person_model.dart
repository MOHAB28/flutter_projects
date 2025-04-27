import 'package:school_app/domain/models/subject/subject_model.dart';

class PersonModel {
  final String fullName;
  final String phoneNumber;
  final String address;
  final List<String> subjects;
  final List<Section> sections;

  const PersonModel({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.subjects,
    required this.sections,
  });
}
