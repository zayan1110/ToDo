import 'package:flutter/material.dart';
import '../../../data/database.dart';
import 'events_and_tasks_card.dart';

class EventsOrTasksPage extends StatefulWidget {
  final String databaseKey;
  const EventsOrTasksPage({super.key, required this.databaseKey});

  @override
  State<EventsOrTasksPage> createState() => _EventsOrTasksPageState();
}

class _EventsOrTasksPageState extends State<EventsOrTasksPage> {
  late final Database db;

  @override
  void initState() {
    db = Database(widget.databaseKey);
    super.initState();
  }

  void _deleteItem(int index) {
    setState(() {
      db.database.removeAt(index);
      db.updateDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: db.database.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (_, index) => EventOrTaskCard(
          taskOrEvent: db.database[index],
          onDelete: () => _deleteItem(index),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .8,
          crossAxisSpacing: 5,
        ),
      ),
    );
  }
}
