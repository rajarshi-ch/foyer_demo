import 'dart:developer';

import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final int id;
  final String themeColor;
  final double textSize;

  const ProfileEntity({
    this.id = -1,
    required this.themeColor,
    required this.textSize,
  });

  @override
  List<Object?> get props => [id, themeColor, textSize];

  bool equalsExceptId(ProfileEntity other) {
    log('Comparing ${themeColor} with ${other.themeColor}');
    log('Comparing ${textSize} with ${other.textSize}');
    return themeColor == other.themeColor && textSize == other.textSize;
  }
}
