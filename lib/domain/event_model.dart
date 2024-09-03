import 'event_or_task_model.dart';

class Event extends EventOrTask {
  final DateTime endDate;

  Event({required super.title, required super.date, required this.endDate, required super.description});
}
