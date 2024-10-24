import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../constants.dart';
import '../../data/database.dart';
import '../../domain/todo_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final Database db = Database(AppConstants.TodoBoxKey);
  static final TextEditingController _controller = TextEditingController();

  @override
  void dispose() => {_controller.dispose(), super.dispose()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: db.database.length,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) => Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  onPressed: (_) => setState(() => db.removeFromDatabase(db.database[index])),
                ),
              ],
            ),
            child: TodoTile(todo: db.database[index])),
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: () => createNew(context)),
    );
  }

  void saveNew() => {db.addToDatabase(Todo(name: _controller.text)), _controller.clear()};

  void createNew(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: const ButtonStyle(alignment: Alignment.centerLeft),
                      child: const Text("Cancel"),
                    ),
                    const Text("New To Do"),
                    TextButton(
                      style: const ButtonStyle(alignment: Alignment.centerRight),
                      onPressed: () => {setState(() => saveNew()), Navigator.pop(context)},
                      child: const Text("Add"),
                    ),
                  ],
                ),

                //
                TextField(controller: _controller)
              ],
            ),
          ),
        ),
      );
}

class TodoTile extends StatefulWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  final Database db = Database(AppConstants.TodoBoxKey);

  void checkBoxChanged() => setState(() {widget.todo.toggleChecked(); db.updateDatabase();});

  TextDecoration? isCheckedLine() => widget.todo.isChecked ? TextDecoration.lineThrough : null;

  IconData isCheckedIcon() => widget.todo.isChecked ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: checkBoxChanged,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Icon(isCheckedIcon(), color: Theme.of(context).colorScheme.onPrimaryContainer),
            const SizedBox(width: 10),
            Text(
              widget.todo.name,
              style: TextStyle(decoration: isCheckedLine(), color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}
