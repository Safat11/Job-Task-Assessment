
import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  List<AlarmItem> alarms = [
    AlarmItem(time: '7:10 pm', date: 'Fri 21 Mar 2025', isEnabled: true),
    AlarmItem(time: '6:55 pm', date: 'Fri 21 Mar 2025', isEnabled: false),
    AlarmItem(time: '7:10 pm', date: 'Fri 21 Mar 2025', isEnabled: true),
  ];

  @override
  Widget build(BuildContext context) {
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

                // Selected Location section
                const Text(
                  'Selected Location',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white.withOpacity(0.7),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Add your location',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Alarms section
                const Text(
                  'Alarms',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                // Alarm items
                Expanded(
                  child: ListView.separated(
                    itemCount: alarms.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      final alarm = alarms[index];
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 26, 67, 1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  alarm.time,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  alarm.date,
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
                                value: alarm.isEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    alarms[index].isEnabled = value;
                                  });
                                },
                                activeColor:  Colors.white,
                                activeTrackColor:  Color.fromRGBO(82, 0, 255, 1),
                                inactiveThumbColor: Colors.black,
                                inactiveTrackColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new alarm functionality
          setState(() {
            alarms.add(AlarmItem(
              time: '8:00 pm',
              date: 'Fri 21 Mar 2025',
              isEnabled: true,
            ));
          });
        },
        backgroundColor: const Color(0xFF7C4DFF),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class AlarmItem {
  String time;
  String date;
  bool isEnabled;

  AlarmItem({
    required this.time,
    required this.date,
    required this.isEnabled,
  });
}