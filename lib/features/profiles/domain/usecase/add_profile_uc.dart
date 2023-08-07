import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foyer_demo/core/usecases/usecase.dart';
import 'package:foyer_demo/features/profiles/domain/entity/profile_entity.dart';
import 'package:foyer_demo/features/profiles/domain/repository/profile_repository.dart';

import '../../../../core/error/failures.dart';

class AddProfile implements UseCase<int, Params> {
  final ProfileRepository repository;

  AddProfile(this.repository);

  @override
  Future<Either<Failure, int>> call(Params params) async {
    return await repository.addProfile(
        profile: params.profile, locationId: params.locationId);
  }
}

class Params extends Equatable {
  final int locationId;
  final ProfileEntity profile;
  const Params({required this.profile, required this.locationId});

  @override
  List<Object> get props => [locationId, profile];
}
