import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'resources/app_colors.dart';
import 'resources/theme/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            ListTile(
              title: const Text('Dark Mode'),
              trailing: CupertinoSwitch(value: provider.isDarkMode, activeColor: AppColors.greenDark, onChanged: (_) => provider.toggleTheme()),
            ),
          ],
        ),
      ),
    );
  }
}
