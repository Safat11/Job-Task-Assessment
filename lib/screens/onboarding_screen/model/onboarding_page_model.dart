class OnboardingPageModel {
  final String imagePath;
  final double imageWidth;
  final double imageHeight;
  final String title;
  final String subtitle;
  final double? imageTopMargin;

  OnboardingPageModel({
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight,
    required this.title,
    required this.subtitle,
    this.imageTopMargin,
  });
}
