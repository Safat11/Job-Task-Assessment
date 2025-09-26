import 'package:get/get.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/onboarding_screen/on_boarding_screen_template.dart';
import 'all_bindings.dart';
import 'app_routes.dart';

List<GetPage> appRootRoutesFile = <GetPage>[

  GetPage(
    name: AppRoutes.homeScreen,
    binding: AppBindings(),
    page: () => HomeScreen(),
  ),


  GetPage(
    name: AppRoutes.onboardingScreen,
    page: () => OnboardingScreen(),
    // binding: GeneralBindings(),
  ),




];
