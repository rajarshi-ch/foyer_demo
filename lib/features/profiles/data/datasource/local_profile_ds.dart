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
  Future<int> addProfile({required ProfileModel profile}) async {
    try {
      final db = await databaseHelper.database;

      var result = await db.insert(
        kProfilesTableName,
        profile.toJson(),
        conflictAlgorithm: ConflictAlgorithm.fail,
      );
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
        return ProfileModel.fromJson(maps[i]);
      });
    } catch (e) {
      log(e.toString());
      throw LocalDatabaseException();
    }
  }
}
