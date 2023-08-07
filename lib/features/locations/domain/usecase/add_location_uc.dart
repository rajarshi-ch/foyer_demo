import 'package:dartz/dartz.dart';
import 'package:foyer_demo/core/error/failures.dart';
import 'package:foyer_demo/core/usecases/usecase.dart';
import 'package:foyer_demo/features/locations/domain/entity/location.dart';
import 'package:foyer_demo/features/locations/domain/repository/location_repo.dart';

class AddLocation implements OptionUseCase<Location> {
  final LocationRepository repository;

  AddLocation(this.repository);

  @override
  Future<Option<Failure>> call(Location location) async {
    return await repository.addLocation(location: location);
  }
}
