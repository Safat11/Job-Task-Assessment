import 'package:hive/hive.dart';

part 'alarm.g.dart';

@HiveType(typeId: 0)
class Alarm extends HiveObject {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  String title;

  @HiveField(2)
  int id; // unique id for notification

  @HiveField(3)
  bool active;

  Alarm({
    required this.dateTime,
    required this.title,
    required this.id,
    this.active = true,
  });
}
