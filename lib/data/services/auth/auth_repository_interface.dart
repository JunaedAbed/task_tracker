import 'package:task_tracker/presentation/login_screen/models/login_request_model.dart';
import 'package:task_tracker/presentation/login_screen/models/login_response_model.dart';

abstract class AuthRepositoryInterface {
  Future<LoginResponseModel> login(LoginRequestModel entity);
  Future<String> getCustomerId();
  Future<bool> isLoggedIn();
  Future<String> getUserToken();
}
