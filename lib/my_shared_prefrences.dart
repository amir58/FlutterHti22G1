import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance ?? await SharedPreferences.getInstance();
  }

  static String getString(SharedKeys key, [String defValue = ""]) {
    return _prefsInstance!.getString(key.name) ?? defValue;
  }

  static Future<bool> setString(SharedKeys key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key.name, value);
  }

}

class Constants {
  static const String username = "username";
  static const String userId = "userId";
  static const String language = "language";
}

enum SharedKeys {
  username,
  userId,
  language,
  theme,
}
