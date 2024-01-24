import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/presentation/login_screen/view/login_screen.dart';
import 'package:task_tracker/presentation/splash_screen/view/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String initialRoute = '/initialRoute';
  static const String loginScreen = '/login_screen';

  static List<GetPage> pages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: initialRoute, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
  ];
}
