---

# Flutter Onboarding App – Project Documentation

---

## 1. Project Overview

The **Flutter Onboarding App** is a mobile application designed to guide users through **onboarding screens**, request **location access**, and allow users to **set alarms and notifications**. The app follows the **provided Figma design** and emphasizes **clean architecture, responsive UI, and smooth user experience**.

**Objectives:**

* Implement 3 onboarding screens with skip functionality
* Request and display user location
* Set alarms and trigger local notifications
* Store alarms locally (optional)

---

## 2. Features

### 2.1 Onboarding Screens

* Screen 1: Introduces syncing with nature’s rhythm
* Screen 2: Explains effortless and automatic syncing
* Screen 3: Mentions relaxation and unwinding
* Skip Button: Allows skipping onboarding

### 2.2 Location Access

* Requests location permission
* Displays selected/fetched location
* Handles permission denial gracefully

### 2.3 Alarm & Notifications

* Set alarms using a **date & time picker**
* Display a list of alarms with time and date
* Trigger notifications using `flutter_local_notifications`

### 2.4 Local Storage (Optional)

* Persist alarms using **SQLite** or **Shared Preferences**
* Load saved alarms on app launch

---

## 3. Installation & Setup

1. **Clone the repository**

2. **Install dependencies**

```bash
flutter pub get
```

4. **Run the app**

```bash
flutter run
```

## 5. Screenshots

(Insert screenshots of onboarding, location, and alarm screens here):
![Onboarding-Image1](https://github.com/user-attachments/assets/12337f34-3dc8-42f3-a16b-71150d488749)

![Onboarding-Image2](https://github.com/user-attachments/assets/f924789e-c8ca-4dfc-8edd-81fa3ce61cf6)

![Onboarding-Image3](https://github.com/user-attachments/assets/62e1ba37-20ab-4819-9d97-c5542fbcc46e)

![Onboarding-Image4](https://github.com/user-attachments/assets/47f56ca1-7e37-48de-9999-da835f62d1f3)

![Onboarding-Image5](https://github.com/user-attachments/assets/4d21d8a9-fc12-4ab7-a31e-e2d8556922a5)

---

## 6. Demo Video

Watch the app in action: [Loom Video Link]([YOUR_LOOM_VIDEO_LINK](https://www.loom.com/share/d153a5842e7c4726a3d7e725e0412603)

---

## 7. Notes

* UI is responsive across devices
* Handles **permissions and errors** gracefully
* Follows **clean code practices** and folder structure
* Fully matches the Figma design

---

