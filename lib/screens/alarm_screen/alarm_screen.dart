import 'package:alarm_task/screens/alarm_screen/widget/alarm_item.dart';
import 'package:alarm_task/screens/alarm_screen/widget/location_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_alarm_screen/add_alarm_screen.dart';
import 'controller/alarm_controller.dart';


class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AlarmController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(32, 26, 67, 1),
              Color(0xFF2D1B69),
              Color(0xFF4C3C7C),
              Color(0xFF6B63B5),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Selected Location',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                Obx(() => LocationCard(
                  labelText: 'Your Area',
                  locationText: controller.formatLocation(controller.position.value),
                )),

                const SizedBox(height: 40),
                const Text(
                  'Alarms',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.loadAlarms();
                    },
                    child: Obx(() => ListView.separated(
                      physics:
                      const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.alarms.length,
                      separatorBuilder: (_, __) =>
                      const SizedBox(height: 15),
                      itemBuilder: (context, index) {
                        final alarm = controller.alarms[index];
                        return AlarmItem(
                          alarm: alarm,
                          time: controller.formatTime(alarm.dateTime),
                          date: controller.formatDate(alarm.dateTime),
                          onToggle: (value) async {
                            await controller.toggleAlarm(index, value);
                          },
                        );
                      },
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final res = await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddAlarmScreen()),
          );
          if (res == true) controller.loadAlarms(); // reload alarms after adding
        },
        backgroundColor: const Color(0xFF7C4DFF),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}