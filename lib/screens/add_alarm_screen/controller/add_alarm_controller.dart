import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../../../models/alarm.dart';
import '../../../services/notification_service.dart';
import '../../../services/storage_service.dart';

class AddAlarmController extends GetxController {
  DateTime? pickedDateTime;
  final titleController = TextEditingController(text: 'Alarm');

  Future<void> pickDateTime(BuildContext context) async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (pickedDate == null) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now.add(const Duration(minutes: 1))),
    );
    if (pickedTime == null) return;

    pickedDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    update();
  }

  String get pickedStr {
    if (pickedDateTime == null) return 'No time picked';
    return DateFormat('hh:mm a, EEE dd MMM yyyy').format(pickedDateTime!);
  }

  Future<void> saveAlarm(BuildContext context) async {
    if (pickedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pick date & time first')),
      );
      return; // <-- removed Navigator.pop
    }

    final id = Random().nextInt(1 << 31);
    final alarm = Alarm(
      dateTime: pickedDateTime!,
      title: titleController.text,
      id: id,
      active: true,
    );

    await StorageService.addAlarm(alarm);

    await NotificationService.scheduleNotification(
      id: alarm.id,
      title: alarm.title,
      body: DateFormat('hh:mm a, EEE dd MMM yyyy').format(alarm.dateTime),
      scheduledDate: alarm.dateTime,
    );

    Navigator.of(context).pop(true); // return true to AlarmScreen
  }
}
