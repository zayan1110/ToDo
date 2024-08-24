import 'task_and_event_model.dart';

class Task extends TaskAndEvent {
  final Status status;
  Task({required this.status, required super.name, required super.date, required super.description});
}

enum Status { toDo, done, late }
