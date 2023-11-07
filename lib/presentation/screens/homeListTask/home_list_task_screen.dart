import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter/presentation/providers/task_provider.dart';

import '../../widgets/task/add_task_form.dart';
import '../settings/settings_screen.dart';

class HomeListTask extends StatefulWidget {
  const HomeListTask({super.key});

  @override
  HomeListTaskState createState() => HomeListTaskState();
}

class HomeListTaskState extends State<HomeListTask>{

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Task Manager'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen())
                );
              },
            )],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SafeArea(
            child: Column(
              children: [
                const _TaskDateFilter(),
                _TaskList(taskProvider: taskProvider),
                Row(
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
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

class _TaskDateFilter extends StatelessWidget {
  const _TaskDateFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Today', style: Theme.of(context).textTheme.titleMedium),
        TextButton(
          onPressed: () {},
          child: const Text('See all', style: TextStyle(color: Colors.blue)),
        )
      ],
    );
  }
}

class _TaskList extends StatelessWidget {
  const _TaskList({
    super.key,
    required this.taskProvider,
  });

  final TaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
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
                onChanged: (value) {},
              ),
            ),
          );
        },
      ),
    );
  }
}