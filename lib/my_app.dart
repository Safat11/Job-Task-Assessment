import 'package:alarm_task/routes/all_bindings.dart';
import 'package:alarm_task/widgets/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';
import 'routes/app_routes_file.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    AppSize.size = MediaQuery.of(context).size;

    return ScreenUtilInit(
        designSize: const Size(430, 932),
        ensureScreenSize: true,
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task',
          initialRoute: AppRoutes.onboardingScreen,
          getPages: appRootRoutesFile,
          enableLog: true,
          initialBinding: AppBindings(),
        );
      }
    );
  }
}
