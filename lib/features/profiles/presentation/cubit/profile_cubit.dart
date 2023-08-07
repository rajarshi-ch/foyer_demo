import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foyer_demo/core/enums/screen_status.dart';
import 'package:foyer_demo/core/usecases/usecase.dart';
import 'package:foyer_demo/features/profiles/domain/entity/profile_entity.dart';
import 'package:foyer_demo/features/profiles/domain/repository/profile_repository.dart';
import 'package:foyer_demo/features/profiles/domain/usecase/add_profile_uc.dart';
import 'package:foyer_demo/features/profiles/domain/usecase/get_all_profiles_uc.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@LazySingleton()
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required ProfileRepository repository})
      : addProfileUC = AddProfile(repository),
        getAllProfilesUC = GetAllProfiles(repository),
        super(const ProfileState.initial());

  final AddProfile addProfileUC;
  final GetAllProfiles getAllProfilesUC;

  Future fetchAllProfiles() async {
    //Get all profiles from db and store in state
    log("Fetching all profiles");
    emit(state.copyWith(status: ScreenStatus.loading));
    final result = await getAllProfilesUC.call(NoParams());
    result.fold((failure) => emit(state.copyWith(status: ScreenStatus.error)),
        (profiles) {
      emit(state.copyWith(
          status: ScreenStatus.success,
          allProfilesList: profiles,
          allProfilesMap: {for (var profile in profiles) profile.id: profile}));
    });
  }

  addProfile(ProfileEntity profile, int locationId) async {
    //adds or replaces a location in db and in state
    emit(state.copyWith(status: ScreenStatus.loading));
    final result = await addProfileUC
        .call(Params(profile: profile, locationId: locationId));
    result.fold((failure) => emit(state.copyWith(status: ScreenStatus.error)),
        (id) {
      fetchAllProfiles();
    });
  }
}
