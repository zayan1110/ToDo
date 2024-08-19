import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  final _myBox = Hive.box('MyBox');

  void createInitialData() {
    toDoList = [
      ['Make Tutorial', false],
      ['Do Exercise', false],
    ];
    _myBox.put("TODOLIST", toDoList);
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST") ?? [];
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
