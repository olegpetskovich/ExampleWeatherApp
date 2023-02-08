import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String _savedCityKey = 'savedCityKey';

  static Future<void> saveSelectedCity({required String city}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_savedCityKey, city);
  }

  static Future<String> getSavedCity() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_savedCityKey) ?? "";
  }
}