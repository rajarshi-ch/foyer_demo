import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foyer_demo/core/enums/screen_status.dart';
import 'package:foyer_demo/core/usecases/usecase.dart';
import 'package:foyer_demo/features/locations/domain/entity/location.dart';
import 'package:foyer_demo/features/locations/domain/repository/location_repo.dart';
import 'package:foyer_demo/features/locations/domain/usecase/add_location_uc.dart';
import 'package:foyer_demo/features/locations/domain/usecase/get_all_locations_uc.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';

@LazySingleton()
class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required LocationRepository repository})
      : addLocationUC = AddLocation(repository),
        getAllLocationsUC = GetAllLocations(repository),
        super(const LocationState.initial());

  final AddLocation addLocationUC;
  final GetAllLocations getAllLocationsUC;

  Future fetchAllLocations() async {
    //Get all locations from db and store in state
    log("Fetching all locations");
    emit(state.copyWith(status: ScreenStatus.loading));
    final result = await getAllLocationsUC.call(NoParams());
    result.fold(
        (failure) => emit(state.copyWith(status: ScreenStatus.error)),
        (locations) => emit(state.copyWith(
            status: ScreenStatus.success, allLocations: locations)));
  }

  addLocation(Location location) async {
    //adds or replaces a location in db and in state
    emit(state.copyWith(status: ScreenStatus.loading));
    final result = await addLocationUC.call(location);
    result.fold(
      (failure) => emit(state.copyWith(status: ScreenStatus.error)),
      (id) {
        emit(state.copyWith(
            lastAddedLocationId: id, status: ScreenStatus.success));
      },
    );
  }
}
