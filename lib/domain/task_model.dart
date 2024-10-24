import 'event_or_task_model.dart';

class Task extends EventOrTask {
  // final Status status;
  Task({required super.title, required super.date, required super.description}); // required this.status,
}

// enum Status { Todo, done, late }
