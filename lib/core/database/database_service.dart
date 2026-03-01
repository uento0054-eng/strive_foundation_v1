import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    final path = join(await getDatabasesPath(), 'strive.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE workouts(
            id TEXT PRIMARY KEY,
            name TEXT,
            started_at INTEGER,
            ended_at INTEGER
          )
        ''');
      },
    );

    return _db!;
  }
}
