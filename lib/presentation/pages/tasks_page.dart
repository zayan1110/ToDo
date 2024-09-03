import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widgets/events_or_tasks_page.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventsOrTasksPage(databaseKey: AppConstants.taskBoxKey);
  }
}
