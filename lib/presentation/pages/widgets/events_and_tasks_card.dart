import 'package:flutter/material.dart';

import '../../../domain/event_or_task_model.dart';

class EventOrTaskCard extends StatelessWidget {
  final EventOrTask taskOrEvent;
  const EventOrTaskCard({super.key, required this.taskOrEvent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            taskOrEvent.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          Row(
            children: [
              // Start Time
              Text(
                taskOrEvent.date.toString(),
                style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ],
          )
        ],
      ),
    );
  }
}
