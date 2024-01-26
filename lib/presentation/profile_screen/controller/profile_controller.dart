import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/data/services/auth/auth_repository.dart';
import 'package:task_tracker/data/services/auth/auth_repository_interface.dart';
import 'package:task_tracker/presentation/login_screen/models/login_response_model.dart';

class ProfileController extends GetxController {
  final AuthRepositoryInterface _authRepo = AuthRepository();

  Rx<LoginResponseModel?> user = LoginResponseModel().obs;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  fetchUser() async {
    user.value = await _authRepo.getCustomer();
  }

  logout() async {
    var response = await _authRepo.logout();

    if (response) {
      Get.offNamed(AppRoutes.loginScreen);
    }
  }
}
