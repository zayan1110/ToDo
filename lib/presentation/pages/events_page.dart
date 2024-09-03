import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widgets/events_or_tasks_page.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventsOrTasksPage(databaseKey: AppConstants.eventBoxKey);
  }
}
