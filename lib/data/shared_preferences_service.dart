import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<SharedPreferences> get _storage async =>
      await SharedPreferences.getInstance();

  Future<bool?> getBool(String key) async {
    return (await _storage).getBool(key);
  }

  Future<bool> setBool({required String key, required bool value}) async {
    return (await _storage).setBool(key, value);
  }

  Future<int?> getInt(String key) async {
    return (await _storage).getInt(key);
  }

  Future<bool> setInt({required String key, required int value}) async {
    return (await _storage).setInt(key, value);
  }

  Future<double?> getDouble(String key) async {
    return (await _storage).getDouble(key);
  }

  Future<bool> setDouble({required String key, required double value}) async {
    return (await _storage).setDouble(key, value);
  }

  Future<String?> getString(String key) async {
    return (await _storage).getString(key);
  }

  Future<bool> setString({required String key, required String value}) async {
    return (await _storage).setString(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    return (await _storage).getStringList(key);
  }

  Future<bool> setStringList(
      {required String key, required List<String> value}) async {
    return (await _storage).setStringList(key, value);
  }

  Future<Map<String, dynamic>?> getMap(String key) async {
    String? result = (await _storage).getString(key);
    if (result?.isEmpty ?? true) {
      return null;
    }
    return jsonDecode(result!);
  }

  Future<bool> setMap(
      {required String key, required Map<String, dynamic> value}) async {
    return (await _storage).setString(key, jsonEncode(value));
  }

  Future<bool> delete({required String key}) async {
    return (await _storage).remove(key);
  }

  Future<bool> deleteAll() async {
    return (await _storage).clear();
  }
}
