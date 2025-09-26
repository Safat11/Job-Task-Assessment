import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constants/app_color.dart';
import '../../constants/image_path.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_size.dart';
import '../../widgets/common_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingPages = [
    {
      "imagePath": AppImagePath.image1,
      "imageWidth": AppSize.width(value: 332),
      "imageHeight": AppSize.height(value: 227),
      "title": 'Discover the world, one journey at a time.',
      "subtitle":
      "From hidden gems to iconic destinations, we make travel simple, inspiring, and unforgettable. Start your next adventure today."
    },
    {
      "imagePath": AppImagePath.image2,
      "imageWidth": AppSize.width(value: 243),
      "imageHeight": AppSize.width(value: 220),
      "title": 'Grow with every purchase!',
      "subtitle":
      "Get started today and unlock exclusive benefits for your customers."
    },
    {
      "imagePath": AppImagePath.image3,
      "imageWidth": AppSize.width(value: 222),
      "imageHeight": AppSize.height(value: 280),
      "imageTopMargin": AppSize.height(value: 200),
      "title": 'Greetings Store Owner!',
      "subtitle": "Set up your shop and start offering exclusive benefits to your customers."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          /// Background
          Stack(

            children: [
              Image.asset( onboardingPages[_currentPage]["imagePath"]),
              Positioned(
                  top: 50,
                  right: 20,
                  child: InkWell(
                      onTap: (){
                        Get.offAllNamed(AppRoutes.homeScreen);
                      },
                      child: Text('Skip',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),)))
            ],
          ),

          SizedBox(height: 30,),
          /// PageView
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                final page = onboardingPages[index];
                return buildOnboardingPage(

                  imageWidth: page["imageWidth"],
                  imageHeight: page["imageHeight"],
                  title: page["title"],
                  subtitle: page["subtitle"],
                );
              },
            ),
          ),

          /// Bottom section
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingPages.length,
                          (index) => Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        child: _buildIndicator(index),
                      ),
                    ),
                  ),

                  SizedBox(height: 12,),
                  /// Next button
                  CommonElevatedButton(

                    width: double.infinity,
                    text: _currentPage == onboardingPages.length - 1
                        ? "Get Started"
                        : "Next",
                    backgroundColor: Color.fromRGBO(82, 1, 255, 1),
                    onPressed: () {
                      if (_currentPage < onboardingPages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Get.offAllNamed(AppRoutes.homeScreen);

                      }
                    },
                    height: 48,
                    borderRadius: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Indicator
  Widget _buildIndicator(int index) {
    return Container(
      width: index == _currentPage ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: index == _currentPage
            ? Color.fromRGBO(82, 1, 255, 1)
            : Color.fromRGBO(44, 53, 113, 1),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  /// Onboarding page builder
  Widget buildOnboardingPage({
    required String title,
    required String subtitle,
    double imageHeight = 250,
    double imageWidth = double.infinity,
    double? imageTopMargin, // nullable
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: IntrinsicHeight(
          child: Column(
            children: [
              SizedBox(height: imageTopMargin ),

              // SizedBox(height: AppSize.height(value: 120)),
              Text(
                title,
                textAlign: TextAlign.start,

                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.
                  white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                subtitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  }

