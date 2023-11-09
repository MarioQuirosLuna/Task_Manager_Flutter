import 'package:flutter/material.dart';

import '../../../domain/entities/task.dart';
import '../../providers/task_provider.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    super.key,
    required this.taskProvider,
    required this.task,
  });

  final TaskProvider taskProvider;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.description),
            Text(
              "${task.date.year}-"
                  "${task.date.month.toString().padLeft(2, '0')}-"
                  "${task.date.day.toString().padLeft(2, '0')}",
            ),
          ],
        ),
        trailing: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            taskProvider.toggleTaskCompletion(task.id);
          },
        ),
      ),
    );
  }
}