import 'package:flutter/material.dart';
import '../../../models/alarm.dart';

class AlarmItem extends StatelessWidget {
  final Alarm alarm;
  final String time;
  final String date;
  final ValueChanged<bool> onToggle;

  const AlarmItem({
    super.key,
    required this.alarm,
    required this.time,
    required this.date,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(32, 26, 67, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: alarm.active,
              onChanged: onToggle,
              activeColor: Colors.white,
              activeTrackColor: const Color.fromRGBO(82, 0, 255, 1),
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
