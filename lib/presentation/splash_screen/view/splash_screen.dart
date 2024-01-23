import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_tracker/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  ImageConstants.splashBg,
                  // height: 165.adaptSize,
                  // width: 277.adaptSize,
                ),
              ),
              // Text("data")
            ],
          ),
        ),
      ),
    );
  }
}
