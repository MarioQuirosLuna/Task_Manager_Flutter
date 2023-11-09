import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/task_provider.dart';

class TaskDateFilter extends StatelessWidget {
  const TaskDateFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            '${taskProvider.isShowAllTasks ? 'All' : 'Today'} tasks',
            style: Theme.of(context).textTheme.titleLarge
        ),
        TextButton(
          onPressed: () {
            taskProvider.changeShowAllTasks();
          },
          child: Text(
            'Show ${taskProvider.isShowAllTasks ? 'today' : 'all'} tasks',
              style: const TextStyle(color: Colors.blue)
          ),
        )
      ],
    );
  }
}