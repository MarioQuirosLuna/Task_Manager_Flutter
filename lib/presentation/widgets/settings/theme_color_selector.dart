import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/app_theme.dart';

class ThemeColorSelector extends StatelessWidget{
  const ThemeColorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Theme Color', style: Theme.of(context).textTheme.titleMedium),
        DropdownButton<int>(
          value: themeProvider.selectedColor,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: Theme.of(context).textTheme.titleMedium,
          underline: Container(
            height: 2,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          onChanged: (int? newValue) {
            themeProvider.updateTheme(newValue!, isDarkMode);
          },
          items: themeProvider.colorThemes.asMap().map((index, color) => MapEntry(
              index,
              DropdownMenuItem<int>(
                value: index,
                child: Text('Color ${index + 1}', style: TextStyle(color: color)),
              )
          )).values.toList(),
        ),
      ],
    );
  }

}