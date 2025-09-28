/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlarmTile extends StatelessWidget {
  final Alarm alarm;
  final VoidCallback onDelete;

  const AlarmTile({Key? key, required this.alarm, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('hh:mm a EEE dd MMM yyyy').format(alarm.dateTime);
    return Card(
      child: ListTile(
        title: Text(alarm.title),
        subtitle: Text(timeStr),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
*/
