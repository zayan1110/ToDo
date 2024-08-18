import 'package:flutter/material.dart';
class ToDoTile extends StatefulWidget {
  final String TaskName;
  final bool taskcombleted;
  final Function(bool?) onChanged;
  final Function() deleteFunction;

  ToDoTile({
    super.key,
    required this.TaskName,
    required this.taskcombleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  _ToDoTileState createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  bool _isTaskCompleted = false;

  @override
  void initState() {
    super.initState();
    _isTaskCompleted = widget.taskcombleted;
  }

  void _toggleTaskCompletion() {
    setState(() {
      _isTaskCompleted = !_isTaskCompleted;
      widget.onChanged(_isTaskCompleted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 5.0),
      child: Container(
        height: 800,
        width: 1000,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _toggleTaskCompletion,
              child: Text(
                widget.TaskName,
                style: TextStyle(
                  color: Colors.black,
                  decoration: _isTaskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "date",
                  style: TextStyle(color: Colors.black),
                ),
                IconButton(
                  onPressed: widget.deleteFunction,
                  icon: Icon(
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
