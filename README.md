# Flutter Onboarding Alarm

Features:
- 3 onboarding screens (Skip / Next)
- Request location permission and show selected location
- Add alarms using Date & Time picker
- Local notifications (flutter_local_notifications + timezone)
- Persistent storage using Hive

Quick run:
1. `flutter pub get`
2. (Optional) If you want to regenerate adapters: `flutter pub run build_runner build`
   *Note: The generated Hive adapter `alarm.g.dart` is already provided in this package so build_runner is not required to run the demo.*
3. `flutter run`

Notes:
- Add required permission entries in AndroidManifest and Info.plist (see earlier messages).
- For accurate notification scheduling, test on a real device/emulator with proper notification support.
![WhatsApp Image 2025-09-26 at 12 39 06 PM (2)](https://github.com/user-attachments/assets/9fab547b-8ea9-4c45-9ee5-0b873c02fffa)
![WhatsApp Image 2025-09-26 at 12 39 06 PM (1)](https://github.c![WhatsApp Image 2025-09-26 at 12 39 07 PM](https://github.com/user-attachments/assets/a663cfb1-8edc-489d-acee-8af9fd00d439)
![WhatsApp Image 2025-09-26 at 12 39 07 PM (1)](https://github.com/user-attachments/assets/9db6e553-7b3a-4cfa-bfc8-95f72f59e583)
![WhatsApp Image 2025-09-26 at 12 39 06 PM](https://github.com/user-attachments/assets/432810d0-d833-40f2-9b5a-71d5c5dc1ede)
om/user-attachments/assets/20f45bee-34c0-45af-83ee-e7ad65d2b637)
