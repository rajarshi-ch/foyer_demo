import 'package:dartz/dartz.dart';
import 'package:foyer_demo/core/error/failures.dart';
import 'package:foyer_demo/core/usecases/usecase.dart';
import 'package:foyer_demo/features/locations/domain/entity/location.dart';
import 'package:foyer_demo/features/locations/domain/repository/location_repo.dart';

class GetAllLocations implements UseCase<List<Location>, NoParams> {
  final LocationRepository repository;

  GetAllLocations(this.repository);

  @override
  Future<Either<Failure, List<Location>>> call(NoParams params) async {
    return await repository.getAllLocations();
  }
}
