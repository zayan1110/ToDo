import 'package:flutter/material.dart';
import '../../../domain/event_or_task_model.dart';

class EventOrTaskCard extends StatelessWidget {
  final EventOrTask taskOrEvent;
  final VoidCallback onDelete;
  const EventOrTaskCard({
    super.key,
    required this.taskOrEvent,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskOrEvent.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              Row(
                children: [
                  Text(
                    taskOrEvent.date.toString(),
                    style: TextStyle(
                        fontSize: 10,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 4,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
