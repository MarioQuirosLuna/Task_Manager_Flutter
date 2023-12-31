import 'package:flutter/material.dart';

import '../../../../providers/task_provider.dart';
import 'date_field_input.dart';

class AddTaskForm extends StatelessWidget{
  const AddTaskForm({
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
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              maxLength: 35,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              maxLength: 150,
              maxLines: 5,
              minLines: 1,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            DateFieldInput(
                dateController: dateController
            ),
          ],
        ),
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
              if(titleController.text.isNotEmpty && descriptionController.text.isNotEmpty && dateController.text.isNotEmpty){
                taskProvider.addTask(
                  titleController.text,
                  descriptionController.text,
                  DateTime.parse(dateController.text),
                );
                Navigator.of(context).pop();
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Please fill all fields.',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    duration: Duration(seconds: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                );
              }
            },
            child: const Text("Save")
        ),
      ],
    );
  }
}