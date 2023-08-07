import 'package:equatable/equatable.dart';
import 'package:foyer_demo/core/constants/const_values.dart';

class Location extends Equatable {
  final double latitude;
  final double longitude;
  final int profileId;
  const Location({
    required this.latitude,
    required this.longitude,
    this.profileId = kDefaultProfileId,
  });

  @override
  List<Object?> get props => [latitude, longitude, profileId];

  static bool isValidLatitude(double latitude) {
    return latitude >= -90.0 && latitude <= 90.0;
  }

  static bool isValidLongitude(double longitude) {
    return longitude >= -180.0 && longitude <= 180.0;
  }

  static bool isValidLocation(double latitude, double longitude) {
    return isValidLatitude(latitude) && isValidLongitude(longitude);
  }
}
