import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> listTask = [
    Task(
        id: const Uuid().v1(),
        title: "Task 1",
        description: "Description 1",
        date: DateTime.now(),
        isDone: false
    ),
    Task(
        id: const Uuid().v1(),
        title: "Task 2",
        description: "Description 2",
        date: DateTime.now(),
        isDone: true
    ),
    Task(
        id: const Uuid().v1(),
        title: "Task 3",
        description: "Description 3",
        date: DateTime.now(),
        isDone: false
    )
  ];

  void addTask(String title, String description, DateTime date){
    final task = Task(
      id: const Uuid().v1(),
      title: title,
      description: description,
      date: date,
      isDone: false,
    );
    listTask.add(task);
    notifyListeners();
  }
  void removeTask(String id){
    listTask.removeWhere((element) => element.id == id);
    notifyListeners();
  }
  void toggleTaskCompletion(String id){
    final task = listTask.firstWhere((element) => element.id == id);
    task.isDone = !task.isDone;
    notifyListeners();
  }
  List<Task> get tasks => listTask;
}