import 'package:foyer_demo/features/locations/domain/entity/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.latitude,
    required super.longitude,
    required super.profileId,
    super.id,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      id: json['id'],
      profileId: json['profileId'],
    );
  }

  factory LocationModel.fromEntity(Location location) {
    return LocationModel(
      latitude: location.latitude,
      longitude: location.longitude,
      profileId: location.profileId,
      id: location.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'profileId': profileId,
      'id': id,
    };
  }
}
