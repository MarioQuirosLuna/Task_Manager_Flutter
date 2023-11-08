import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter/presentation/providers/task_provider.dart';

import '../../../config/theme/app_theme.dart';
import '../../widgets/home/task/option_buttons.dart';
import '../../widgets/home/task/task_date_filter.dart';
import '../../widgets/home/task_list.dart';
import '../settings/settings_screen.dart';

class HomeListTask extends StatefulWidget {
  const HomeListTask({super.key});

  @override
  HomeListTaskState createState() => HomeListTaskState();
}

class HomeListTaskState extends State<HomeListTask>{

  @override
  void initState() {
    super.initState();
    _loadTasks();
    _loadSettings();
  }

  _loadTasks() async {
    final taskProvider = context.read<TaskProvider>();
    await taskProvider.loadTasks();
  }

  _loadSettings() async {
    final settingsProvider = context.read<ThemeProvider>();
    await settingsProvider.loadSettings();
  }

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
                const TaskDateFilter(),
                TaskList(taskProvider: taskProvider),
                OptionButtons(taskProvider: taskProvider)
              ],
            ),
          )
        ),
      ),
    );
  }
}