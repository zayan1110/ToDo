import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'constants.dart';
import 'domain/todo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  [await Hive.openBox(AppConstants.TodoBoxKey), await Hive.openBox(AppConstants.taskBoxKey), await Hive.openBox(AppConstants.eventBoxKey)];

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [SystemUiOverlay.top]);

  runApp(const NoteApp());
}
