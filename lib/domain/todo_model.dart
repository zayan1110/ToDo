import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class ToDo extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  bool isChecked = false;
  // final ToDoPriority priority;

  ToDo({required this.name});

  void toggleChecked() => isChecked = !isChecked;
}

enum ToDoPriority { veryImportant, semiImportant, notImportant }
