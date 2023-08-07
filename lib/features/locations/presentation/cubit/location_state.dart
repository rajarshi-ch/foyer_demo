part of 'location_cubit.dart';

class LocationState extends Equatable {
  const LocationState(
      {required this.allLocations,
      required this.status,
      this.lastAddedLocationId});

  const LocationState.initial({
    this.allLocations = const [],
    this.status = ScreenStatus.initial,
    this.lastAddedLocationId,
  });

  final List<Location> allLocations;
  final ScreenStatus status;
  final int? lastAddedLocationId;

  @override
  List<Object> get props => [allLocations, status];

  LocationState copyWith({
    List<Location>? allLocations,
    ScreenStatus? status,
    int? lastAddedLocationId,
  }) {
    return LocationState(
        allLocations: allLocations ?? this.allLocations,
        status: status ?? this.status,
        lastAddedLocationId: lastAddedLocationId ?? this.lastAddedLocationId);
  }
}
