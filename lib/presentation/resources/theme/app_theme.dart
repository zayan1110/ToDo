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

      // Todo: Text Theme
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
        titleTextStyle: TextStyle(fontSize: 22, color: AppColors.secondaryDark, fontWeight: FontWeight.w500),
      ),

      // Todo: Text Theme
      textTheme: const TextTheme(),

      // Text Field
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.primaryDark,
        prefixIconColor: AppColors.secondaryDark,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintStyle: const TextStyle(color: AppColors.secondaryDark),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      ),

      // TextField Cursor Color
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),

      // Tab Bar
      tabBarTheme: const TabBarTheme(
        dividerColor: Colors.transparent,
        labelColor: AppColors.secondaryDark,
        indicatorColor: AppColors.greenDark,
        unselectedLabelColor: AppColors.secondaryDark,
        overlayColor: MaterialStatePropertyAll(AppColors.greenDark),
      ),

      // AlertDialog
      dialogTheme: const DialogTheme(surfaceTintColor: Colors.transparent, backgroundColor: AppColors.backgroundDark),

      // BottomSheet
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: AppColors.black,
      ),

      // TextButton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: AppColors.primary,
        ),
      ),

      // ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.greenDark,
        ),
      ),

      // ListTile
      listTileTheme: const ListTileThemeData(
        tileColor: AppColors.primaryDark,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
