import 'dart:developer';

import 'package:foyer_demo/core/constants/const_values.dart';
import 'package:foyer_demo/core/database/database.dart';
import 'package:foyer_demo/core/error/exceptions.dart';
import 'package:foyer_demo/features/profiles/data/datasource/profile_ds.dart';
import 'package:foyer_demo/features/profiles/data/models/profile_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: ProfileDataSource)
class LocalProfileDataSource implements ProfileDataSource {
  final DatabaseHelper databaseHelper;

  LocalProfileDataSource(this.databaseHelper);
  @override
  Future<int> addProfile(
      {required ProfileModel profile, required int locationId}) async {
    try {
      final db = await databaseHelper.database;
      log('Adding ${profile.toJson()} to Profiles Table, LocationId : $locationId');
      var result = await db.insert(
        kProfilesTableName,
        profile.toJson(),
        conflictAlgorithm: ConflictAlgorithm.fail,
      );
      log('Added new profile with id $result');
      var r2 = await db.update(kLocationsTableName, {'profileId': result},
          where: 'id = $locationId');

      log('Successfully updated location table entry with id $r2');
      return result;
    } catch (e) {
      log(e.toString());
      throw LocalDatabaseException();
    }
  }

  @override
  Future<List<ProfileModel>> getAllProfiles() async {
    try {
      final db = await databaseHelper.database;
      // Query the table for all The Locations.
      final List<Map<String, dynamic>> maps =
          await db.query(kProfilesTableName);

      // Convert the List<Map<String, dynamic> into a List<LocationModel>.
      return List.generate(maps.length, (i) {
        log('${maps[i]}');
        return ProfileModel.fromJson(maps[i]);
      });
    } catch (e) {
      log(e.toString());
      throw LocalDatabaseException();
    }
  }
}
