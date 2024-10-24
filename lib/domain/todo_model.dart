import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  bool isChecked = false;

  Todo({
    required this.name,
  });

  void toggleChecked() => isChecked = !isChecked;
}

enum TodoPriority { veryImportant, semiImportant, notImportant }
