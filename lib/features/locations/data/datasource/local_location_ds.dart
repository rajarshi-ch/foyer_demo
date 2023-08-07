import 'package:foyer_demo/core/constants/const_values.dart';
import 'package:foyer_demo/core/database/database.dart';
import 'package:foyer_demo/core/error/exceptions.dart';
import 'package:foyer_demo/features/locations/data/datasource/location_ds.dart';
import 'package:foyer_demo/features/locations/data/models/location_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: LocationDataSource)
class LocalLocationDataSource implements LocationDataSource {
  final DatabaseHelper databaseHelper;

  LocalLocationDataSource(this.databaseHelper);
  @override
  Future addLocation({required LocationModel location}) async {
    try {
      final db = await databaseHelper.database;

      await db.insert(
        kLocationsTableName,
        location.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } on Error {
      throw LocalDatabaseException();
    }
  }

  @override
  Future<List<LocationModel>> getAllLocations() async {
    try {
      final db = await databaseHelper.database;
      // Query the table for all The Locations.
      final List<Map<String, dynamic>> maps =
          await db.query(kLocationsTableName);

      // Convert the List<Map<String, dynamic> into a List<LocationModel>.
      return List.generate(maps.length, (i) {
        return LocationModel.fromJson(maps[i]);
      });
    } on Error {
      throw LocalDatabaseException();
    }
  }
}
