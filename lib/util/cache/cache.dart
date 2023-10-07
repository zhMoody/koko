import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class NotInitialized extends Error {}

class Cache {
  static Cache? _instance;

  Cache._();

  late SharedPreferences? _preferences;

  static Cache get shared => _instance ??= Cache._();

  Future<void> init() async {
    try {
      _preferences = await SharedPreferences.getInstance();
    } on FlutterError {
      throw NotInitialized();
    }
  }

  set<T>(String key, T value) {
    if (value is bool) _preferences?.setBool(key, value);
    if (value is String) _preferences?.setString(key, value);
    if (value is int) _preferences?.setInt(key, value);
    if (value is double) _preferences?.setDouble(key, value);
  }

  setList(String key, List<String> value) {
    _preferences?.setStringList(key, value);
  }

  T? get<T>(String key) {
    return _preferences?.get(key) as T?;
  }

  remove(String key) {
    _preferences?.remove(key);
  }

  Future<bool>? clear() {
    return _preferences?.clear();
  }
}
