import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  DatabaseHelper() {
    init();
  }

  Future<void> init() async {
    _database ??= await initDatabase();
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null, instantiate it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    // Get the device's documents directory for storing the database.
    final String path =
        join(await getDatabasesPath(), 'task_tracker_database.db');

    // Open the database. Can also add version and onCreate/onUpgrade callbacks.
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Create tables if needed
        db.execute('''
          CREATE TABLE IF NOT EXISTS user_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            themeData TEXT,
            token TEXT,
            customerId TEXT
          )
        ''');
      },
    );
  }

  Future<void> clearPreferencesData() async {
    final Database db = await database;
    await db.delete('user_data');
  }

  Future<void> setThemeData(String value) async {
    final Database db = await database;
    await db.rawInsert(
        'INSERT OR REPLACE INTO user_data (themeData) VALUES (?)', [value]);
  }

  Future<String> getThemeData() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result =
        await db.query('user_data', columns: ['themeData']);
    return result.isNotEmpty ? result.first['themeData'] : 'primary';
  }

  Future<bool> setAuthToken(String token) async {
    final Database db = await database;
    await db.rawInsert(
        'INSERT OR REPLACE INTO user_data (token) VALUES (?)', [token]);
    return true;
  }

  Future<String> getAuthToken() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result =
        await db.query('user_data', columns: ['token']);
    return result.isNotEmpty ? result.first['token'] : '';
  }

  Future<bool> setCustomerId(String customerId) async {
    final Database db = await database;
    await db.rawInsert(
        'INSERT OR REPLACE INTO user_data (customerId) VALUES (?)',
        [customerId]);
    return true;
  }

  Future<String> getCustomerId() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result =
        await db.query('user_data', columns: ['customerId']);
    return result.isNotEmpty ? result.first['customerId'] : '';
  }

  Future<bool> isLoggedIn() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result =
        await db.query('user_data', columns: ['token']);
    return result.isNotEmpty;
  }
}
