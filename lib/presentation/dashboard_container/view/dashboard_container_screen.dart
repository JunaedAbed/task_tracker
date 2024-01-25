import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/presentation/dashboard_screen/view/dashboard_screen.dart';
import 'package:task_tracker/presentation/profile_screen/view/profile_screen.dart';
import 'package:task_tracker/presentation/tasks_screen/view/tasks_screen.dart';
import 'package:task_tracker/widgets/custom_bottom_bar.dart';

class DashboardContainerScreen extends StatelessWidget {
  const DashboardContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.red,
          body: Navigator(
            key: Get.nestedKey(1),
            initialRoute: AppRoutes.dashboardScreen,
            onGenerateRoute: (routeSetting) => GetPageRoute(
                page: () => getCurrentPage(routeSetting.name!),
                transition: Transition.noTransition),
          ),
          bottomNavigationBar: _buildBottomBar()),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardScreen;
      case BottomBarEnum.Tasks:
        return AppRoutes.tasksScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.dashboardScreen:
        return const DashboardScreen();
      case AppRoutes.tasksScreen:
        return const TasksScreen();
      case AppRoutes.profileScreen:
        return const ProfileScreen();

      default:
        return const DashboardScreen();
    }
  }
}
