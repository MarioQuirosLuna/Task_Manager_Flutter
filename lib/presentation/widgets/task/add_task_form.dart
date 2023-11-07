import 'package:flutter/material.dart';

import '../../providers/task_provider.dart';
import 'date_field_input.dart';

class AddTaskFrom extends StatelessWidget{
  const AddTaskFrom({
    super.key,
    required this.taskProvider
  });

  final TaskProvider taskProvider;

  @override
  Widget build(BuildContext context){
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    return AlertDialog(
      title: const Text(
        'Add Task',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          DateFieldInput(
              dateController: dateController
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("Cancel")
        ),
        TextButton(
            onPressed: (){
              taskProvider.addTask(
                  titleController.text,
                  descriptionController.text,
                  DateTime.parse(dateController.text),
              );
            },
            child: const Text("Save")
        ),
      ],
    );
  }
}