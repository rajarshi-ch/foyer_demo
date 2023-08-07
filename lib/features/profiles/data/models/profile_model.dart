import 'package:foyer_demo/features/profiles/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel(
      {required super.themeColor, required super.textSize, super.id});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      themeColor: json['themeColor'],
      textSize: json['textSize'].toDouble(),
    );
  }

  factory ProfileModel.fromEntity(ProfileEntity profile) {
    return ProfileModel(
      id: profile.id,
      themeColor: profile.themeColor,
      textSize: profile.textSize,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'themeColor': themeColor,
      'textSize': textSize,
    };
  }
}
