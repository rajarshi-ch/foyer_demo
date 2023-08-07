import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foyer_demo/core/error/exceptions.dart';
import 'package:foyer_demo/core/error/failures.dart';
import 'package:foyer_demo/features/profiles/data/datasource/profile_ds.dart';
import 'package:foyer_demo/features/profiles/data/models/profile_model.dart';
import 'package:foyer_demo/features/profiles/domain/entity/profile_entity.dart';
import 'package:foyer_demo/features/profiles/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, int>> addProfile(
      {required ProfileEntity profile, required int locationId}) async {
    try {
      var result = await dataSource.addProfile(
          profile: ProfileModel.fromEntity(profile), locationId: locationId);
      return Right(result);
    } on LocalDatabaseException {
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProfileEntity>>> getAllProfiles() async {
    try {
      List<ProfileModel> result = await dataSource.getAllProfiles();
      return right(result);
    } on LocalDatabaseException {
      return left(LocalDatabaseFailure());
    }
  }
}
