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
}
