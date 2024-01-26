import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/presentation/login_screen/models/login_response_model.dart';
import 'package:task_tracker/presentation/profile_screen/controller/profile_controller.dart';
import 'package:task_tracker/widgets/custom_image_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
        backgroundColor: const Color(0XFFFAFAFF),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Profile"),
        ),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color: theme.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(12.adaptSize),
                  ),
                  height: 80.v,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(imagePath: ImageConstants.userLogo),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text((controller.user.value?.user?.name)
                                  .toString()),
                              Text((controller.user.value?.user?.email)
                                  .toString()),
                            ],
                          ),
                        )),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14.v),
                GestureDetector(
                  onTap: () => controller.logout(),
                  child: Container(
                    height: 60.v,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.adaptSize),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.h, vertical: 18.v),
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstants.logout,
                          ),
                          SizedBox(width: 8.h),
                          Text(
                            "Log Out",
                            style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 16.fSize,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
