import 'package:flutter/material.dart';

import '../presentation/resources/routes.dart';
import '../presentation/resources/theme/app_theme.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: AppTheme.getLightMode(),
      darkTheme: AppTheme.getDarkMode(),
      debugShowCheckedModeBanner: false,
      initialRoute: NamedRoutes.mainView,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
