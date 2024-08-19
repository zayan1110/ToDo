import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../data/database.dart';
import '../resources/util/dialog_Box.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
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

  void checkBoxChanged(bool? value, int index) {
    setState(() => db.toDoList[index][1] = !db.toDoList[index][1]);
    db.updateDataBase();
  }

  void saveNewToDo() {
    setState(() => db.toDoList.add([_controller.text, false]));
    Navigator.of(context).pop();
    _controller.clear();

    db.updateDataBase();
  }

  void createNewToDo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        onSave: saveNewToDo,
        controller: _controller,
        onCancel: Navigator.of(context).pop,
      ),
    );
  }

  void deleteToDo(int index) {
    setState(() => db.toDoList.removeAt(index));
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 3,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) => ToDoTile(title: index.toString()),
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: () => createNewToDo(context)),
    );
  }
}

class ToDoTile extends StatelessWidget {
  final String title;
  const ToDoTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Icon(
              Icons.check_box_outline_blank_rounded,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            const SizedBox(width: 10),
            Text("Hello World", style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)),
          ],
        ),
      ),
    );
  }
}
