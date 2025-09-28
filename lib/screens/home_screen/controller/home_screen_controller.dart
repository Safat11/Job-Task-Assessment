import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../../models/alarm.dart';
import '../../../services/location_service.dart';
import '../../../services/storage_service.dart';


class HomeController extends GetxController {
  Position? position;
  List<Alarm> alarms = [];
  bool isLoadingLocation = false;
  String locationText = 'Use Current Location';
  String? addressName;
  String? areaName;

  @override
  void onInit() {
    super.onInit();
    loadLocation();
    loadAlarms();
  }

  Future<void> loadLocation() async {
    final pos = await LocationService.getCurrentPosition();
    position = pos;
    update();
  }

  void loadAlarms() {
    final list = StorageService.getAllAlarms();
    list.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    alarms = list;
    update();
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    isLoadingLocation = true;
    locationText = 'Getting Location...';
    update();

    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        showLocationDialog(
          context,
          'Location Service Disabled',
          'Location services are disabled. Please enable location services to continue.',
        );
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          showLocationDialog(
            context,
            'Permission Denied',
            'Location permissions are denied. Please grant location permission to use this feature.',
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        showLocationDialog(
          context,
          'Permission Denied Forever',
          'Location permissions are permanently denied. Please go to settings and enable location permission for this app.',
        );
        return;
      }

      // Get current position
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      position = pos;
      locationText = 'Location Updated!';
      update();

      // Get address
      await getAddressFromCoordinates(pos.latitude, pos.longitude);

      // Reset button text
      Future.delayed(const Duration(seconds: 2), () {
        locationText = 'Use Current Location';
        update();
      });
    } catch (e) {
      showLocationDialog(context, 'Error', 'Failed to get location: $e');
      locationText = 'Use Current Location';
      update();
    } finally {
      isLoadingLocation = false;
      update();
    }
  }

  void showLocationDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  Future<void> getAddressFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        // Area name
        String area = '';
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          area = place.subLocality!;
        } else if (place.locality != null && place.locality!.isNotEmpty) {
          area = place.locality!;
        }

        // Full address
        List<String> parts = [];
        if (place.street != null && place.street!.isNotEmpty) {
          parts.add(place.street!);
        }
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          parts.add(place.subLocality!);
        }
        if (place.locality != null && place.locality!.isNotEmpty) {
          parts.add(place.locality!);
        }
        if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
          parts.add(place.administrativeArea!);
        }
        if (place.country != null && place.country!.isNotEmpty) {
          parts.add(place.country!);
        }

        areaName = area.isNotEmpty ? area : 'Unknown Area';
        addressName = parts.isNotEmpty ? parts.join(', ') : 'Address not found';
      }
    } catch (e) {
      areaName = 'Area name not available';
      addressName = 'Address not available';
    }
    update();
  }
}
