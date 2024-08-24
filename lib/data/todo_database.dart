import 'package:hive/hive.dart';

import '../domain/todo_model.dart';

const String _boxKey = "BOX_KEY";
const String _toDoKey = "TODO_KEY";

class ToDoDatabase {
  ToDoDatabase._();

  factory ToDoDatabase() => _instance;

  static final ToDoDatabase _instance = ToDoDatabase._();

  List get toDos => _todo;

  static final _box = Hive.box(_boxKey);

  void updateDatabase() => _box.put(_toDoKey, _todo);

  void addToDo(ToDo todo) => {_todo.add(todo), updateDatabase()};

  void removeToDo(ToDo todo) => {_todo.remove(todo), updateDatabase()};

  final List _todo = _box.get(_toDoKey, defaultValue: [ToDo(name: "Make New TO Do")]);
}
