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
            token TEXT,
            customerId TEXT,
            customerName TEXT,
            customerMail TEXT
          )
        ''');
      },
    );
  }

  Future<void> clearPreferencesData() async {
    final Database db = await database;
    await db.delete('user_data');
  }

  Future<bool> saveCustomerData({
    required String token,
    required String customerId,
    required String customerName,
    required String customerMail,
  }) async {
    final Database db = await database;
    try {
      await db.rawInsert(
        'INSERT OR REPLACE INTO user_data (token, customerId, customerName, customerMail) VALUES (?, ?, ?, ?)',
        [token, customerId, customerName, customerMail],
      );

      return true;
    } catch (e) {
      print('Error updating customer data: $e');
      return false;
    }
  }

  // Future<bool> setAuthToken(String token) async {
  //   final Database db = await database;
  //   await db.rawInsert(
  //       'INSERT OR REPLACE INTO user_data (token) VALUES (?)', [token]);
  //   return true;
  // }

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

  Future<bool> setCustomerName(String customerName) async {
    final Database db = await database;
    await db.rawInsert(
        'INSERT OR REPLACE INTO user_data (customerName) VALUES (?)',
        [customerName]);
    return true;
  }

  Future<String> getCustomerName() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result =
        await db.query('user_data', columns: ['customerName']);
    return result.isNotEmpty ? result.first['customerName'] : '';
  }

  Future<bool> setCustomerMail(String customerMail) async {
    final Database db = await database;
    await db.rawInsert(
        'INSERT OR REPLACE INTO user_data (customerMail) VALUES (?)',
        [customerMail]);
    return true;
  }

  Future<Map<String, dynamic>> getCustomer() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result = await db.query('user_data');

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return {};
    }
  }

  Future<String> getCustomerMail() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result =
        await db.query('user_data', columns: ['customerMail']);
    return result.isNotEmpty ? result.first['customerMail'] : '';
  }

  Future<bool> isLoggedIn() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result =
        await db.query('user_data', columns: ['token']);

    return result.isNotEmpty;
  }
}
