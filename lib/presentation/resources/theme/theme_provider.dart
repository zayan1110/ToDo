import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  set themeMode(ThemeMode themeMode) => {_themeMode = themeMode, notifyListeners()};

  void toggleTheme() => _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
}
