import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? database;

  static Future<Database> getDb() async {
    if (database != null) return database!;

    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'FDTP.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE IF NOT EXISTS book(
            name TEXT,
            price INTEGER,
            image TEXT,
            user_email TEXT
          )
        """);
      },
    );

    return database!;
  }
}
