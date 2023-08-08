part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.allProfilesList,
    required this.allProfilesMap,
    required this.status,
    required this.currentLocation,
  });

  const ProfileState.initial({
    this.allProfilesList = const [],
    this.allProfilesMap = const {},
    this.status = ScreenStatus.initial,
    this.currentLocation,
  });

  final List<ProfileEntity> allProfilesList;
  final Map<int, ProfileEntity> allProfilesMap;
  final ScreenStatus status;
  final Location? currentLocation;

  ProfileEntity? get currentProfile {
    if (currentLocation != null) {
      return allProfilesMap[currentLocation!.profileId];
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [
        allProfilesList,
        allProfilesMap,
        status,
        currentLocation,
        currentProfile
      ];

  ProfileState copyWith({
    List<ProfileEntity>? allProfilesList,
    Map<int, ProfileEntity>? allProfilesMap,
    ScreenStatus? status,
    Location? currentLocation,
  }) {
    return ProfileState(
      allProfilesList: allProfilesList ?? this.allProfilesList,
      allProfilesMap: allProfilesMap ?? this.allProfilesMap,
      status: status ?? this.status,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }
}
