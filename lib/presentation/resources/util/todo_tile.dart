import 'package:flutter/material.dart';

class ToDoTile extends StatefulWidget {
  final String TasksPageName;
  final bool TasksPagecombleted;
  final Function(bool?) onChanged;
  final Function() deleteFunction;

  const ToDoTile({
    super.key,
    required this.TasksPageName,
    required this.TasksPagecombleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  _ToDoTileState createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  bool _isTasksPageCompleted = false;

  @override
  void initState() {
    super.initState();
    _isTasksPageCompleted = widget.TasksPagecombleted;
  }

  void _toggleTasksPageCompletion() {
    setState(() {
      _isTasksPageCompleted = !_isTasksPageCompleted;
      widget.onChanged(_isTasksPageCompleted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 5.0),
      child: Container(
        height: 800,
        width: 1000,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _toggleTasksPageCompletion,
              child: Text(
                widget.TasksPageName,
                style: TextStyle(
                  color: Colors.black,
                  decoration: _isTasksPageCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "date",
                  style: TextStyle(color: Colors.black),
                ),
                IconButton(
                  onPressed: widget.deleteFunction,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
