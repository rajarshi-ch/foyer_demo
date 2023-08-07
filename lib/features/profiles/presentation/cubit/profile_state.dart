part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState(
      {required this.allProfilesList,
      required this.allProfilesMap,
      required this.status});

  const ProfileState.initial(
      {this.allProfilesList = const [],
      this.allProfilesMap = const {},
      this.status = ScreenStatus.initial});

  final List<ProfileEntity> allProfilesList;
  final Map<int, ProfileEntity> allProfilesMap;
  final ScreenStatus status;

  @override
  List<Object> get props => [allProfilesList, allProfilesMap, status];
  ProfileState copyWith({
    List<ProfileEntity>? allProfilesList,
    Map<int, ProfileEntity>? allProfilesMap,
    ScreenStatus? status,
  }) {
    return ProfileState(
      allProfilesList: allProfilesList ?? this.allProfilesList,
      allProfilesMap: allProfilesMap ?? this.allProfilesMap,
      status: status ?? this.status,
    );
  }
}
