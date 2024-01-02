import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ScreenSizeConverter {
  static late ScreenSizeConverter instance;

  double baseHeight;
  double baseWidth;
  double screenWidth;
  double screenHeight;

  // Default base dimensions for different platforms should be change as per the
  // design
  static const double mobileBaseHeight = 800.0;
  static const double mobileBaseWidth = 360.0;
  static const double webBaseHeight = 1080.0;
  static const double webBaseWidth = 1920.0;
  static const double desktopBaseHeight = 900.0;
  static const double desktopBaseWidth = 1600.0;

  ScreenSizeConverter._internal({
    required this.baseHeight,
    required this.baseWidth,
    required this.screenWidth,
    required this.screenHeight,
  });

  /// Initializes the converter with the current context and platform.
  static void initialize(BuildContext context) {
    double baseHeight, baseWidth;
    if (kIsWeb) {
      baseHeight = webBaseHeight;
      baseWidth = webBaseWidth;
    } else {
      var isDesktop =
          MediaQuery.of(context).size.width > 600; // Threshold for desktop
      baseHeight = isDesktop ? desktopBaseHeight : mobileBaseHeight;
      baseWidth = isDesktop ? desktopBaseWidth : mobileBaseWidth;
    }

    instance = ScreenSizeConverter._internal(
      baseHeight: baseHeight,
      baseWidth: baseWidth,
      screenWidth: MediaQuery.of(context).size.width,
      screenHeight: MediaQuery.of(context).size.height,
    );
  }

  /// Scales height based on the device's screen height.
  double scaleHeight(double height) {
    return screenHeight * (height / baseHeight);
  }

  /// Scales width based on the device's screen width.
  double scaleWidth(double width) {
    return screenWidth * (width / baseWidth);
  }

  /// Scales text size based on the device's screen width.
  double scaleText(double size) {
    return screenWidth * (size / baseWidth);
  }
}
