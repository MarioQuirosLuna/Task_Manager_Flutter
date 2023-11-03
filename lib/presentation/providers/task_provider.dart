import 'package:flutter/material.dart';

import '../../domain/entities/task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> listTask = [
    Task(
        1,
        title: "Task 1",
        description: "Description 1",
        date: DateTime.now(),
        isDone: false
    )
  ];



  void addTask(Task task){
    task.id = listTask.length + 1;
    listTask.add(task);
    notifyListeners();
  }
  void removeTask(Task task){
    listTask.remove(task);
    notifyListeners();
  }
  void updateTask(Task task){
    listTask[listTask.indexWhere((element) => element.id == task.id)] = task;
    notifyListeners();
  }
}