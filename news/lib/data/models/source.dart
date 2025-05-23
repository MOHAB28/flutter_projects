import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String? id;
  final String name;

  const Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?,
      name: json['name'] as String,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
