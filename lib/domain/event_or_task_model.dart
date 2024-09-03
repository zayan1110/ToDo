abstract class EventOrTask {
  final String title;
  final DateTime date;
  final String description;
  // final Category category;

  const EventOrTask({required this.title, required this.date, required this.description});
}

enum Category { work, home, life, study }
