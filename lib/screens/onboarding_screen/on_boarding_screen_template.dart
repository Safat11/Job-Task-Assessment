import 'package:alarm_task/screens/onboarding_screen/widget/onboarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_color.dart';
import '../../widgets/common_button_widget.dart';
import 'controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          /// Background + Skip
          Obx(() {
            final currentPage = controller.currentPage.value;
            return Stack(
              children: [
                Image.asset(controller.onboardingPages[currentPage].imagePath),
                Positioned(
                  top: 50,
                  right: 20,
                  child: InkWell(
                    onTap: controller.skip,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),

          /// Content Section (Title + Subtitle + Indicators + Button)
          Expanded(
            child: Column(
              children: [
                /// PageView for Title and Subtitle
                Expanded(
                  flex: 2, // This controls the space for title/subtitle
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.onboardingPages.length,
                    onPageChanged: (page) {
                      controller.currentPage.value = page;
                    },
                    itemBuilder: (context, index) {
                      final page = controller.onboardingPages[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center, // Center the content
                          children: [
                            Text(
                              page.title,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              page.subtitle,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// Bottom section (Indicators + Button)
                Expanded(
                  flex: 1, // This controls the space for indicators and button
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// Indicators
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.onboardingPages.length,
                                  (index) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: buildIndicator(
                                  isActive: index == controller.currentPage.value,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          /// Next / Get Started Button
                          CommonElevatedButton(
                            width: double.infinity,
                            text: controller.currentPage.value ==
                                controller.onboardingPages.length - 1
                                ? "Get Started"
                                : "Next",
                            backgroundColor: const Color.fromRGBO(82, 1, 255, 1),
                            onPressed: controller.nextPage,
                            height: 48,
                            borderRadius: 8,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}