import 'package:hive/hive.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/domain/event_model.dart';
import 'package:todo_app/domain/task_model.dart';

import '../domain/todo_model.dart';

class Database {
  late final Box _box;
  late final List database;
  final String _databaseKey;

  Database(this._databaseKey) {
    _box = Hive.box(_databaseKey);
    database = _box.get(_databaseKey, defaultValue: _defaultValue());
  }

  List _defaultValue() => [
        switch (_databaseKey) {
          AppConstants.toDoBoxKey => ToDo(name: "Add a New To Do Now!"),
          AppConstants.taskBoxKey => Task(title: "Task", date: DateTime.now(), description: "description"),
          AppConstants.eventBoxKey => Event(title: "Event", date: DateTime.now(), endDate: DateTime.now(), description: "description"),
          _ => null
        }
      ];

  void updateDatabase() => _box.put(_databaseKey, database);
  void addToDatabase(dynamic data) => {database.add(data), updateDatabase()};
  void removeFromDatabase(dynamic data) => {database.remove(data), updateDatabase()};
}
