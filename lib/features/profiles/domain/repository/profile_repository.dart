import 'package:dartz/dartz.dart';
import 'package:foyer_demo/features/profiles/domain/entity/profile_entity.dart';

import '../../../../core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<ProfileEntity>>> getAllProfiles();
  Future<Either<Failure, int>> addProfile(
      {required ProfileEntity profile, required int locationId});
}
