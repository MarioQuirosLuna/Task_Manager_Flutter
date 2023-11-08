import 'package:flutter/material.dart';

import '../../../providers/task_provider.dart';
import 'addtask/add_task_form.dart';


class OptionButtons extends StatelessWidget {
  const OptionButtons({
    super.key,
    required this.taskProvider,
  });

  final TaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context){
                  return AddTaskFrom(taskProvider: taskProvider);
                }
            );
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}