import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/presentation/dashboard_container/view/dashboard_container_screen.dart';
import 'package:task_tracker/presentation/dashboard_screen/view/dashboard_screen.dart';
import 'package:task_tracker/presentation/login_screen/view/login_screen.dart';
import 'package:task_tracker/presentation/profile_screen/view/profile_screen.dart';
import 'package:task_tracker/presentation/registration_screen/view/registration_screen.dart';
import 'package:task_tracker/presentation/splash_screen/view/splash_screen.dart';
import 'package:task_tracker/presentation/tasks_screen/view/tasks_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String initialRoute = '/initialRoute';
  static const String loginScreen = '/login_screen';
  static const String registerScreen = '/registration_screen';
  static const String dashboardScreen = '/dashboard_screen';
  static const String dashboardContainerScreen = '/dashboard_container_screen';
  static const String tasksScreen = '/tasks_screen';
  static const String profileScreen = '/profile_screen';

  static List<GetPage> pages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: initialRoute, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: registerScreen, page: () => const RegistrationScreen()),
    GetPage(name: dashboardScreen, page: () => const DashboardScreen()),
    GetPage(
        name: dashboardContainerScreen,
        page: () => const DashboardContainerScreen()),
    GetPage(name: tasksScreen, page: () => const TasksScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
  ];
}
