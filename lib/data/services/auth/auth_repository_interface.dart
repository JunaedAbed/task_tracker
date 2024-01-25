import 'package:task_tracker/presentation/login_screen/models/login_request_model.dart';
import 'package:task_tracker/presentation/login_screen/models/login_response_model.dart';
import 'package:task_tracker/presentation/registration_screen/models/register_request_model.dart';
import 'package:task_tracker/presentation/registration_screen/models/register_response_model.dart';

abstract class AuthRepositoryInterface {
  Future<LoginResponseModel> login(LoginRequestModel entity);
  Future<RegisterResponseModel> register(RegisterRequestModel entity);
  Future<String> getCustomerId();
  Future<bool> isLoggedIn();
  Future<String> getUserToken();
}
