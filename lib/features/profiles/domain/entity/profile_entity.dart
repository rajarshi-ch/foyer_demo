import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final int id;
  final String themeColor;
  final double textSize;

  const ProfileEntity({
    required this.id,
    required this.themeColor,
    required this.textSize,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      id: json['id'],
      themeColor: json['themeColor'],
      textSize: json['textSize'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'themeColor': themeColor,
      'textSize': textSize,
    };
  }

  @override
  List<Object?> get props => [id, themeColor, textSize];
}
