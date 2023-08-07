import 'package:foyer_demo/features/locations/data/models/location_model.dart';

abstract class LocationDataSource {
  Future<List<LocationModel>> getAllLocations();
  Future<int> addLocation({required LocationModel location});
}
