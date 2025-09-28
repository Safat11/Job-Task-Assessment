import 'package:flutter/material.dart';

/// Indicator widget
Widget buildIndicator({required bool isActive}) {
  return Container(
    width: isActive ? 24 : 8,
    height: 8,
    decoration: BoxDecoration(
      color: isActive
          ? const Color.fromRGBO(82, 1, 255, 1)
          : const Color.fromRGBO(44, 53, 113, 1),
      borderRadius: BorderRadius.circular(4),
    ),
  );
}

/// Onboarding page widget
Widget buildOnboardingPage({
  required String title,
  required String subtitle,
  double imageHeight = 250,
  double imageWidth = double.infinity,
  double? imageTopMargin,
}) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: imageTopMargin ?? 60),

          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    ),
  );
}
