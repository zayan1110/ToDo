import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/database.dart';
import '../../domain/todo_model.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final Database db = Database(AppConstants.toDoBoxKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: db.database.length,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) => ToDoTile(todo: db.database[index]),
      ),
    );
  }
}

class ToDoTile extends StatefulWidget {
  final ToDo todo;
  const ToDoTile({required this.todo, super.key});

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  final Database db = Database(AppConstants.toDoBoxKey);

  void checkBoxChanged() => setState(() => {widget.todo.toggleChecked(), db.updateDatabase()});

  TextDecoration? isCheckedLine() => widget.todo.isChecked ? TextDecoration.lineThrough : null;

  IconData isCheckedIcon() => widget.todo.isChecked ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: checkBoxChanged,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Icon(isCheckedIcon(), color: Theme.of(context).colorScheme.onPrimaryContainer),
            const SizedBox(width: 10),
            Text(widget.todo.name, style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer, decoration: isCheckedLine())),
          ],
        ),
      ),
    );
  }
}
