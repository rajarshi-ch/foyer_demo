import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foyer_demo/core/error/exceptions.dart';
import 'package:foyer_demo/core/error/failures.dart';
import 'package:foyer_demo/features/locations/data/datasource/location_ds.dart';
import 'package:foyer_demo/features/locations/data/models/location_model.dart';
import 'package:foyer_demo/features/locations/domain/entity/location.dart';
import 'package:foyer_demo/features/locations/domain/repository/location_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource dataSource;

  LocationRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, int>> addLocation({required Location location}) async {
    try {
      var result = await dataSource.addLocation(
          location: LocationModel.fromEntity(location));
      log('Added location with id $result');
      return right(result);
    } on LocalDatabaseException {
      return left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Option<Failure>> assignProfileToLocation({required int id}) {
    // TODO: implement assignProfileToLocation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Location>>> getAllLocations() async {
    try {
      List<LocationModel> result = await dataSource.getAllLocations();
      return right(result);
    } on LocalDatabaseException {
      return left(LocalDatabaseFailure());
    }
  }
}
