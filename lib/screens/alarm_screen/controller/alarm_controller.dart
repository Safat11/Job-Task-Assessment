import 'package:geolocator/geolocator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import '../../../models/alarm.dart';
import '../../../services/location_service.dart';
import '../../../services/notification_service.dart';
import '../../../services/storage_service.dart';
import 'package:get/get.dart';


class AlarmController extends GetxController {
  var position = Rxn<Position>();
  var alarms = <Alarm>[].obs; // reactive list

  @override
  void onInit() {
    super.onInit();
    loadLocation();
    loadAlarms();
  }

  Future<void> loadLocation() async {
    final pos = await LocationService.getCurrentPosition();
    position.value = pos;
  }

  void loadAlarms() {
    final list = StorageService.getAllAlarms();
    list.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    alarms.assignAll(list);
  }

  Future<void> deleteAlarm(Alarm alarm) async {
    await StorageService.removeAlarm(alarm.id);
    await NotificationService.cancelNotification(alarm.id);
    loadAlarms();
  }

  String formatLocation(Position? p) {
    if (p == null) return 'No location selected';
    return 'Lat: ${p.latitude.toStringAsFixed(4)}, Lon: ${p.longitude.toStringAsFixed(4)}';
  }

  Future<void> refreshData() async {
    update();
  }


  String formatTime(DateTime dt) => DateFormat.jm().format(dt);

  String formatDate(DateTime dt) => DateFormat('EEE, d MMM yyyy').format(dt);
}
