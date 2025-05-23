import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class LocalizationState extends Equatable {
  final Locale locale;

  const LocalizationState({required this.locale});

  @override
  List<Object> get props => [locale];
}
