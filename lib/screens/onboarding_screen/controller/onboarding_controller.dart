import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/image_path.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/app_size.dart';
import '../model/onboarding_page_model.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  List<OnboardingPageModel> onboardingPages = [
    OnboardingPageModel(
      imagePath: AppImagePath.image1,
      imageWidth: AppSize.width(value: 332),
      imageHeight: AppSize.height(value: 227),
      title: 'Discover the world, one journey at a time.',
      subtitle:
      "From hidden gems to iconic destinations, we make travel simple, inspiring, and unforgettable. Start your next adventure today.",
    ),
    OnboardingPageModel(
      imagePath: AppImagePath.image2,
      imageWidth: AppSize.width(value: 243),
      imageHeight: AppSize.height(value: 220),
      title: 'Grow with every purchase!',
      subtitle:
      "Get started today and unlock exclusive benefits for your customers.",
    ),
    OnboardingPageModel(
      imagePath: AppImagePath.image3,
      imageWidth: AppSize.width(value: 222),
      imageHeight: AppSize.height(value: 280),
      imageTopMargin: AppSize.height(value: 200),
      title: 'See the beauty, one journey at a time.',
      subtitle:
      "Travel made simple and exciting—discover places you’ll love and moments you’ll never forget.",
    ),
  ];

  void nextPage() {
    if (currentPage.value < onboardingPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(AppRoutes.homeScreen);
    }
  }

  void skip() {
    Get.offAllNamed(AppRoutes.homeScreen);
  }
}
