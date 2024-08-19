import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppTheme {
  static ThemeData getLightMode() {
    return ThemeData(
      // Scaffold Background Color
      scaffoldBackgroundColor: AppColors.secondaryLight,

      // Icon
      iconTheme: const IconThemeData(color: AppColors.backgroundLight),

      // Icon Button
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: AppColors.backgroundLight)),

      // Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.backgroundLight,
      ),

      // App Bar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.secondaryLight,
        titleTextStyle: TextStyle(fontSize: 22, color: AppColors.backgroundLight),
      ),

      // ToDo: Text Theme
      textTheme: const TextTheme(),

      // Text Field
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(20)),
      ),

      //
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        background: AppColors.backgroundLight,
      ),
    );
  }

  static ThemeData getDarkMode() {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primaryContainer: AppColors.secondaryDark,
        onPrimaryContainer: AppColors.primaryDark,
      ),

      // Scaffold Background Color
      scaffoldBackgroundColor: AppColors.backgroundDark,

      // Icon
      iconTheme: const IconThemeData(color: AppColors.secondaryDark),

      // Icon Button
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: AppColors.secondaryDark)),

      // Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.secondaryDark,
      ),

      // App Bar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        titleTextStyle: TextStyle(fontSize: 22, color: AppColors.secondaryDark),
      ),

      // ToDo: Text Theme
      textTheme: const TextTheme(),

      // Text Field
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.primaryDark,
        prefixIconColor: AppColors.secondaryDark,
        hintStyle: const TextStyle(color: AppColors.secondaryDark),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),

      // Tab Bar
      tabBarTheme: const TabBarTheme(
        dividerColor: Colors.transparent,
        labelColor: AppColors.secondaryDark,
        indicatorColor: AppColors.greenDark,
        unselectedLabelColor: AppColors.secondaryDark,
        overlayColor: MaterialStatePropertyAll(AppColors.greenDark),
      ),
    );
  }
}
