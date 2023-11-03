import 'package:flutter/material.dart';

import '../../widgets/settings/dark_mode_selector.dart';
import '../../widgets/settings/theme_color_selector.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Column(
          children: [
            SizedBox(height: 20),
            ThemeColorSelector(),
            SizedBox(height: 20),
            DarkModeSelector(),
          ],
        ),
      ),
    );
  }
}