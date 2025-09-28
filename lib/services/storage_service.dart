import 'package:hive_flutter/hive_flutter.dart';
import '../models/alarm.dart';

class StorageService {
  static const String alarmsBox = 'alarms_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AlarmAdapter());
    await Hive.openBox<dynamic>(alarmsBox);
  }

  static Box<dynamic> getAlarmBox() => Hive.box<dynamic>(alarmsBox);

  static Future<void> addAlarm(Alarm alarm) async {
    final box = getAlarmBox();
    await box.put(alarm.id, alarm);
  }

  static List<Alarm> getAllAlarms() {
    final box = getAlarmBox();
    return box.values.whereType<Alarm>().toList();
  }

  static Future<void> removeAlarm(int id) async {
    final box = getAlarmBox();
    await box.delete(id);
  }
}
