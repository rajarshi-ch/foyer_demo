part of 'location_cubit.dart';

class LocationState extends Equatable {
  const LocationState({required this.allLocations, required this.status});

  const LocationState.initial(
      {this.allLocations = const [], this.status = ScreenStatus.initial});

  final List<Location> allLocations;
  final ScreenStatus status;

  @override
  List<Object> get props => [allLocations, status];

  LocationState copyWith({
    List<Location>? allLocations,
    ScreenStatus? status,
  }) {
    return LocationState(
      allLocations: allLocations ?? this.allLocations,
      status: status ?? this.status,
    );
  }
}
