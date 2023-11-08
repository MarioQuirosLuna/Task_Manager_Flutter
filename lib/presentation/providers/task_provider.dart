import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../data/task_local_storage.dart';
import '../../domain/entities/task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> listTask = [];

  Future<void> loadTasks() async {
    final savedTask = await TaskLocalStorage.loadTasks();
    print("savedTask: $savedTask");
    if(savedTask != null){
      listTask = savedTask;
    }
    notifyListeners();
  }

  void addTask(String title, String description, DateTime date){
    final task = Task(
      id: const Uuid().v1(),
      title: title,
      description: description,
      date: date,
      isDone: false,
    );
    listTask.add(task);
    TaskLocalStorage.saveTasks(listTask);
    notifyListeners();
  }
  void removeTask(String id){
    listTask.removeWhere((element) => element.id == id);
    TaskLocalStorage.saveTasks(listTask);
    notifyListeners();
  }
  void toggleTaskCompletion(String id){
    final task = listTask.firstWhere((element) => element.id == id);
    task.isDone = !task.isDone;
    notifyListeners();
  }
  List<Task> get tasks => listTask;
}