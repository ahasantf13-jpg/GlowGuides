import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _prefs;

  CacheHelper(this._prefs);

  Future<bool> save(String key, Object value) async {
    if (value is String) return _prefs.setString(key, value);
    if (value is bool) return _prefs.setBool(key, value);
    if (value is int) return _prefs.setInt(key, value);
    if (value is double) return _prefs.setDouble(key, value);

    throw UnsupportedError('Type not supported');
  }

  T? get<T>(String key) {
    return _prefs.get(key) as T?;
  }

  Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }

  bool contains(String key) {
    return _prefs.containsKey(key);
  }

  Future<bool> clear() async {
    return _prefs.clear();
  }
}
