import 'package:flutter/material.dart';
import 'package:task_manager_flutter/presentation/widgets/home/card_task.dart';

import '../../providers/task_provider.dart';

class TaskList extends StatelessWidget {
  TaskList({
    super.key,
    required this.taskProvider,
  });

  final TaskProvider taskProvider;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        key: _listKey,
        initialItemCount: taskProvider.tasks.length,
        itemBuilder: (context, index, animation) {
          final task = taskProvider.tasks[index];
          return Dismissible(
            key: Key(task.id.toString()),
            onDismissed: (direction) {
                taskProvider.removeTask(task.id);
            },
            background: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
            secondaryBackground: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red,
              ),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
            child: CardTask(taskProvider: taskProvider, index: index),
          );
        },
      ),
    );
  }
}