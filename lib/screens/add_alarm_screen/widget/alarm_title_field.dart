import 'package:flutter/material.dart';

class AlarmTitleField extends StatelessWidget {
  final TextEditingController controller;

  const AlarmTitleField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Title'),
    );
  }
}
