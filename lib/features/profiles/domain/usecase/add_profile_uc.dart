import 'package:dartz/dartz.dart';
import 'package:foyer_demo/core/usecases/usecase.dart';
import 'package:foyer_demo/features/profiles/domain/entity/profile_entity.dart';
import 'package:foyer_demo/features/profiles/domain/repository/profile_repository.dart';

import '../../../../core/error/failures.dart';

class AddProfile implements UseCase<int, ProfileEntity> {
  final ProfileRepository repository;

  AddProfile(this.repository);

  @override
  Future<Either<Failure, int>> call(ProfileEntity profile) async {
    return await repository.addProfile(profile: profile);
  }
}
