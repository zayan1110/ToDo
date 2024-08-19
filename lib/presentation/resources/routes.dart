import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_view.dart';
import '../settings_screen.dart';
import 'theme/theme_provider.dart';

class NamedRoutes {
  static const String mainView = "/"; // initial route
  static const String settingsScreen = "/settingsScreen";
}

class RouteGenerator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case NamedRoutes.mainView:
        return MaterialPageRoute(builder: (_) => const MainView());
      case NamedRoutes.settingsScreen:
        return MaterialPageRoute(builder: (_) => ChangeNotifierProvider(create: (_) => ThemeProvider(), child: const SettingsScreen()));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() => MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text("No Route Found"))));
}
