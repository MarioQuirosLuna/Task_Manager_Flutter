import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter/presentation/providers/task_provider.dart';
import 'package:task_manager_flutter/presentation/screens/home/home_list_task_screen.dart';

import 'config/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
              create:(_) => TaskProvider(),
          ),
        ],
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getTheme(),
      home: const HomeListTask(),
    );
  }
}