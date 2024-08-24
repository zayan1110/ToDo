import 'task_and_event_model.dart';

class Event extends TaskAndEvent {
  final DateTime endDate;

  Event({required this.endDate, required super.name, required super.date, required super.description});
}
