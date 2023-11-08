import 'package:flutter/material.dart';

import '../../providers/task_provider.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    super.key,
    required this.taskProvider,
    required this.index,
  });

  final TaskProvider taskProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(taskProvider.tasks[index].title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskProvider.tasks[index].description),
            Text(
              "${taskProvider.tasks[index].date.year}-"
                  "${taskProvider.tasks[index].date.month.toString().padLeft(2, '0')}-"
                  "${taskProvider.tasks[index].date.day.toString().padLeft(2, '0')}",
            ),
          ],
        ),
        trailing: Checkbox(
          value: taskProvider.tasks[index].isDone,
          onChanged: (value) {
            taskProvider.toggleTaskCompletion(taskProvider.tasks[index].id);
          },
        ),
      ),
    );
  }
}