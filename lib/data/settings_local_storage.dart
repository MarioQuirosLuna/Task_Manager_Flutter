import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_flutter/domain/entities/settings.dart';

class SettingsLocalStorage{
  static const _key = 'settings';

  static Future<void> saveSettings(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(settings));
  }

  static Future<Settings?> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final settingsJson = prefs.getString(_key);
    if(settingsJson != null){
      return Settings.fromJson(jsonDecode(settingsJson));
    }
    return null;
  }
}