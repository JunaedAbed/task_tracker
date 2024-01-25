import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  // TOKEN
  Future<bool> setAuthToken(String token) async {
    return _sharedPreferences!.setString('TOKEN', token);
  }

  String getAuthToken() {
    try {
      return _sharedPreferences!.getString('TOKEN') ?? '';
    } catch (e) {
      return '';
    }
  }

  // customer ID
  Future<bool> setCustomerId(String token) async {
    return _sharedPreferences!.setString('customerId', token);
  }

  String getCustomerId() {
    try {
      return _sharedPreferences!.getString('customerId') ?? '';
    } catch (e) {
      return '';
    }
  }

  // Check if user is logged in
  bool isLoggedIn() {
    return _sharedPreferences!.containsKey('TOKEN');
  }
}
