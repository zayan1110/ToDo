import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/util/dialog_Box.dart';
import 'package:todo_app/pages/util/todo_tile.dart';

class HomPage extends StatefulWidget {
  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  final _myBox = Hive.box('MyBox');

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updataDataBase();
  }

  void SaveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();

    db.updataDataBase();
  }

  void CreatNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: SaveNewTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updataDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () => CreatNewTask(context),
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.background),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          childAspectRatio: 0.7,
        ),
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            TaskName: db.toDoList[index][0],
            taskcombleted: db.toDoList[index][1],
            onChanged: (value) => CheckBoxChanged(value, index),
            deleteFunction: () => deleteTask(index),
          );
        },
      ),
    );
  }
}

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
