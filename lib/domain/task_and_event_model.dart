abstract class TaskAndEvent {
  final String name;
  final DateTime date;
  final String description;
  // final Category category;

  const TaskAndEvent({required this.name, required this.date, required this.description});
}

enum Category { work, home, life, study }
