import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart'; // reverse geocoding

import '../../../models/alarm.dart';
import '../../../services/location_service.dart';
import '../../../services/notification_service.dart';
import '../../../services/storage_service.dart';

class AlarmController extends GetxController {
  var position = Rxn<Position>();
  var areaName = ''.obs; // new observable for area name
  var alarms = <Alarm>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadLocation();
    loadAlarms();
  }

  Future<void> loadLocation() async {
    final pos = await LocationService.getCurrentPosition();
    position.value = pos;

    if (pos != null) {
      try {
        List<Placemark> placemarks =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);
        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          areaName.value =
          place.subLocality ?? place.locality ?? place.administrativeArea ?? 'Unknown';
        } else {
          areaName.value = 'Unknown Area';
        }
      } catch (e) {
        areaName.value = 'Unknown Area';
      }
    } else {
      areaName.value = 'No location selected';
    }
  }

  void loadAlarms() {
    final list = StorageService.getAllAlarms();
    list.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    alarms.assignAll(list);
  }

  Future<void> toggleAlarm(int index, bool value) async {
    final alarm = alarms[index];
    alarms[index].active = value;
    await StorageService.addAlarm(alarms[index]);
    alarms.refresh();

    // Always show a notification
    await NotificationService.showNotification(
      id: alarm.id ?? index,
      title: value ? 'Alarm Activated' : 'Alarm Deactivated',
      body: value
          ? 'Alarm set for ${formatTime(alarm.dateTime)}'
          : 'Alarm turned off',
    );

    if (value) {
      // Schedule notification only if turned on
      await NotificationService.scheduleNotification(
        id: alarm.id ?? index,
        title: 'Alarm 🔔',
        body: 'Time to wake up!',
        scheduledDate: alarm.dateTime,
      );
    } else {
      // Cancel scheduled notification if turned off
      await NotificationService.cancelNotification(alarm.id ?? index);
    }
  }

  Future<void> deleteAlarm(Alarm alarm) async {
    await StorageService.removeAlarm(alarm.id);
    await NotificationService.cancelNotification(alarm.id);
    loadAlarms();
  }

  String formatLocation(Position? p) {
    if (p == null) return 'No location selected';
    return areaName.value.isNotEmpty
        ? areaName.value
        : 'Lat: ${p.latitude.toStringAsFixed(4)}, Lon: ${p.longitude.toStringAsFixed(4)}';
  }

  Future<void> refreshData() async {
    await loadLocation();
    loadAlarms();
    update();
  }

  String formatTime(DateTime dt) => DateFormat.jm().format(dt);
  String formatDate(DateTime dt) => DateFormat('EEE, d MMM yyyy').format(dt);
}
