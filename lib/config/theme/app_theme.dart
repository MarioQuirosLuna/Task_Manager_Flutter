import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFA904C6);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.pink,
  Colors.cyan,
];

class ThemeProvider extends ChangeNotifier {
  int _selectedColor = 0;
  bool _isDarkMode = true;

  int get selectedColor => _selectedColor;
  bool get isDarkMode => _isDarkMode;
  List<Color> get colorThemes => _colorThemes;

  ThemeData getTheme(){
    final themeColor = _colorThemes[selectedColor];

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: themeColor,
      brightness: _isDarkMode ? Brightness.dark : Brightness.light,
    );
  }

  void updateTheme(int colorIndex, bool isDarkMode){
    _selectedColor = colorIndex;
    _isDarkMode = isDarkMode;
    notifyListeners();
  }
}