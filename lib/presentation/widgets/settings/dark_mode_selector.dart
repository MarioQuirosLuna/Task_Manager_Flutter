import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/app_theme.dart';

class DarkModeSelector extends StatelessWidget {
  const DarkModeSelector({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Dark Mode', style: Theme.of(context).textTheme.titleMedium),
        Switch(
          value: isDarkMode,
          onChanged: (value) {
            isDarkMode = value;
            themeProvider.updateTheme(themeProvider.selectedColor, isDarkMode);
          },
        )
      ],
    );
  }
}