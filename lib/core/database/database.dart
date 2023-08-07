import 'dart:developer';
import 'package:foyer_demo/core/constants/const_values.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@LazySingleton()
class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'foyer_database.db');

    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // TODO : Insert default database entries here
    log("Oncreate database called");
    await db.execute(
      'CREATE TABLE $kLocationsTableName(id INTEGER PRIMARY KEY autoincrement, latitude REAL, longitude REAL, profileId INTEGER)',
    );
    await db.execute(
      'CREATE TABLE $kProfilesTableName(id INTEGER PRIMARY KEY autoincrement, textSize REAL, themeColor TEXT)',
    );
  }

  Future deleteDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'foyer_database.db');

    await databaseFactory.deleteDatabase(dbPath);
  }
}
