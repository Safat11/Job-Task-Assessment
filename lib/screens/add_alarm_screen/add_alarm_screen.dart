import 'package:alarm_task/screens/add_alarm_screen/widget/alarm_time_picker.dart';
import 'package:alarm_task/screens/add_alarm_screen/widget/alarm_title_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/add_alarm_controller.dart';

class AddAlarmScreen extends StatelessWidget {
  const AddAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAlarmController>(
      init: AddAlarmController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text('Add Alarm')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AlarmTitleField(controller: controller.titleController),
                const SizedBox(height: 12),
                AlarmTimePicker(
                  pickedStr: controller.pickedStr,
                  onPick: () => controller.pickDateTime(context),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => controller.saveAlarm(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                    child: Text('Save Alarm'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
