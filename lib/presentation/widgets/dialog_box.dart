import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextEditingController controller;

  const DialogBox({super.key, required this.onSave, required this.onCancel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(controller: controller, decoration: const InputDecoration(hintText: 'Add New')),
      actions: [ElevatedButton(onPressed: onSave, child: const Text("Save")), ElevatedButton(onPressed: onCancel, child: const Text("Cancel"))],
    );
  }
}
