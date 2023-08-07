import 'package:dartz/dartz.dart';
import 'package:foyer_demo/core/usecases/usecase.dart';
import 'package:foyer_demo/features/profiles/domain/entity/profile_entity.dart';
import 'package:foyer_demo/features/profiles/domain/repository/profile_repository.dart';

import '../../../../core/error/failures.dart';

class GetAllProfiles implements UseCase<List<ProfileEntity>, NoParams> {
  final ProfileRepository repository;

  GetAllProfiles(this.repository);

  @override
  Future<Either<Failure, List<ProfileEntity>>> call(NoParams params) async {
    return await repository.getAllProfiles();
  }
}
