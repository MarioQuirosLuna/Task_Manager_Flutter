import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../data/task_local_storage.dart';
import '../../domain/entities/task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> listTask = [];
  List<Task> filterTask = [];
  bool isShowAllTasks = true;

  TaskProvider(){
    isShowAllTasks = true;
  }

  Future<void> loadTasks() async {
    final savedTask = await TaskLocalStorage.loadTasks();
    if(savedTask != null){
      listTask = savedTask;
      filterTask = savedTask;
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
    updateFilter();
  }
  void removeTask(String id){
    listTask.removeWhere((element) => element.id == id);
    TaskLocalStorage.saveTasks(listTask);
    updateFilter();
  }
  void toggleTaskCompletion(String id){
    final task = listTask.firstWhere((element) => element.id == id);
    task.isDone = !task.isDone;
    TaskLocalStorage.saveTasks(listTask);
    notifyListeners();
  }
  void updateFilter() {
    filterTask = isShowAllTasks ? listTask : filterTasksToday(listTask);
    notifyListeners();
  }
  List<Task> filterTasksToday(List<Task> tasks){
    final today = DateTime.now();
    final filteredTasks = tasks.where((element) =>
    element.date.day == today.day &&
        element.date.month == today.month &&
        element.date.year == today.year
    ).toList();
    return filteredTasks;
  }
  bool changeShowAllTasks (){
    isShowAllTasks = !isShowAllTasks;
    updateFilter();
    return isShowAllTasks;
  }

  List<Task> get tasks => listTask;
  List<Task> get filteredTasks => filterTask;
}