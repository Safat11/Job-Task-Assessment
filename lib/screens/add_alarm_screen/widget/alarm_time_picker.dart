import 'package:flutter/material.dart';

class AlarmTimePicker extends StatelessWidget {
  final String pickedStr;
  final VoidCallback onPick;

  const AlarmTimePicker({
    super.key,
    required this.pickedStr,
    required this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Time'),
      subtitle: Text(pickedStr),
      trailing: ElevatedButton(
        onPressed: onPick,
        child: const Text('Pick'),
      ),
    );
  }
}
