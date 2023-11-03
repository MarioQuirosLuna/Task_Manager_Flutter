import 'package:flutter/material.dart';

import '../settings/settings_screen.dart';

class HomeListTask extends StatefulWidget {
  const HomeListTask({super.key});

  @override
  HomeListTaskState createState() => HomeListTaskState();
}

class HomeListTaskState extends State<HomeListTask>{

  @override
  Widget build(BuildContext context) {
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
          child: Text("List Task")
        ),
      ),
    );
  }
}