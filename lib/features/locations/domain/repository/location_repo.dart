import 'package:dartz/dartz.dart';
import 'package:foyer_demo/features/locations/domain/entity/location.dart';

import '../../../../core/error/failures.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Location>>> getAllLocations();
  Future<Option<Failure>> addLocation({required Location location});
  Future<Option<Failure>> assignProfileToLocation({required int id});
}
