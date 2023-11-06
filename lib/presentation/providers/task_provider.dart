import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> listTask = [
    Task(
        const Uuid().v1(),
        title: "Task 1",
        description: "Description 1",
        date: DateTime.now(),
        isDone: false
    ),
    Task(
        const Uuid().v1(),
        title: "Task 2",
        description: "Description 2",
        date: DateTime.now(),
        isDone: true
    ),Task(
        const Uuid().v1(),
        title: "Task 3",
        description: "Description 3",
        date: DateTime.now(),
        isDone: false
    )
  ];

  void addTask(Task task){
    task.id = const Uuid().v1();
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
  List<Task> get tasks => listTask;
}