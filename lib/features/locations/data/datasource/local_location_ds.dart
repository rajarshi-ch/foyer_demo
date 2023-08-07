import 'dart:developer';

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
      log('LocalLocationDataSource.addLocation : Latitude: ${location.latitude}, Longitude: ${location.longitude} , profileId : ${location.profileId}');
      log('Adding ${location.toJson()} to Database');
      await db.insert(
        kLocationsTableName,
        location.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      log(e.toString());
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
        log('Raw database data : ${maps[i].toString()}');
        return LocationModel.fromJson(maps[i]);
      });
    } catch (e) {
      log(e.toString());
      throw LocalDatabaseException();
    }
  }
}
