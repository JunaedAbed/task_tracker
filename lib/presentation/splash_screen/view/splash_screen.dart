import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/presentation/splash_screen/controller/splash_controller.dart';
import 'package:task_tracker/widgets/custom_image_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImageConstants.splashBg,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30.h),
                  child: CustomImageView(
                    imagePath: ImageConstants.logo,
                    height: 200.adaptSize,
                    width: 200.adaptSize,
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
