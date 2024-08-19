import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  runApp(const NoteApp());
}

/*
  * To Learn:
    - Fix Imports
    - Fix Spelling
    - App Architecture
    - Split logic from UI
    - Notice unused variable
    - Use ThemeMode instead of ThemeData
    - Take advantages of Theme as possible
    - Naming of properties: lowerCamelCase
    - Clean main.dart without any additions
    - Learn difference between Screen, View, Page
    - Notice unused parameters and replace with '_'
    - Use theme for theming Widgets like 'TextField'
    - Naming of Methods: starts with verb, lowerCamelCase
    - Don't leave variables or methods in file without class
    - Use 'const' keyword if possible, for widgets and constructors
    - Remove last comma ',', use expression body methods and format code
*/