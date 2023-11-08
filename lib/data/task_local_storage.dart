import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/entities/task.dart';

class TaskLocalStorage {
  static const _key = 'tasks';

  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList(_key, taskList.cast<String>());
  }
  
  static Future<List<Task>?> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList(_key);
    if(taskList != null){
      return taskList.map((taskJson) => Task.fromJson(jsonDecode(taskJson))).toList();
    }
    return null;
  }
}