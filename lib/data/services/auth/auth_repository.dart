import 'package:task_tracker/core/errors/error_controller.dart';
import 'package:task_tracker/core/utils/pref_utils.dart';
import 'package:task_tracker/data/api/api_client.dart';
import 'package:task_tracker/data/services/auth/auth_repository_interface.dart';
import 'package:task_tracker/presentation/login_screen/models/login_request_model.dart';
import 'package:task_tracker/presentation/login_screen/models/login_response_model.dart';

class AuthRepository with ErrorController implements AuthRepositoryInterface {
  final apiClient = ApiClient();

  @override
  Future<LoginResponseModel> login(LoginRequestModel entity) async {
    var body = entity.toMap();

    try {
      var response =
          await apiClient.postData("user/login", body, useBearerToken: false);

      print('RESPONSE: $response');

      var loginResponseModel = loginResponseModelFromJson(response);

      await saveUserToken(loginResponseModel.token.toString());
      await saveCustomerId(loginResponseModel.user!.id.toString());

      print(getUserToken());
      print(getCustomerId());

      print(isLoggedIn());

      return loginResponseModel;
    } catch (e) {
      handleError(e);
      throw Exception('Error in login: $e');
    }
  }

  bool? isLoggedIn() {
    return PrefUtils().isLoggedIn();
  }

  // for  user token
  Future<bool?> saveUserToken(String token) async {
    return await PrefUtils().setAuthToken(token);
  }

  //for get token
  String getUserToken() {
    return PrefUtils().getAuthToken();
  }

  // for  customer ID
  Future<bool?> saveCustomerId(String custId) async {
    return await PrefUtils().setCustomerId(custId);
  }

  //for get token
  String getCustomerId() {
    return PrefUtils().getCustomerId();
  }
}
