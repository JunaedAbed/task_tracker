import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/data/services/auth/auth_repository.dart';
import 'package:task_tracker/data/services/auth/auth_repository_interface.dart';

class SplashController extends GetxController {
  final AuthRepositoryInterface _authRepo = AuthRepository();

  @override
  void onReady() {
    super.onReady();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    bool isLoggedIn = await _authRepo.isLoggedIn();

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (isLoggedIn) {
        Get.offNamed(AppRoutes.dashboardContainerScreen);
      } else {
        Get.offNamed(AppRoutes.loginScreen);
      }
    });
  }
}
