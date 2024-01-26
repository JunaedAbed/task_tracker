import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/core/errors/error_controller.dart';
import 'package:task_tracker/data/api/api_client.dart';
import 'package:task_tracker/data/services/auth/auth_repository_interface.dart';
import 'package:task_tracker/presentation/login_screen/models/login_request_model.dart';
import 'package:task_tracker/presentation/login_screen/models/login_response_model.dart';
import 'package:task_tracker/presentation/registration_screen/models/register_request_model.dart';
import 'package:task_tracker/presentation/registration_screen/models/register_response_model.dart';

class AuthRepository with ErrorController implements AuthRepositoryInterface {
  final apiClient = ApiClient();

  @override
  Future<LoginResponseModel> login(LoginRequestModel entity) async {
    var body = entity.toMap();

    try {
      var response =
          await apiClient.postData("user/login", body, useBearerToken: false);

      var loginResponseModel = loginResponseModelFromJson(response);

      // await saveUserToken(loginResponseModel.token.toString());
      await saveCustomerData(loginResponseModel);

      // apiClient.setBearerToken(loginResponseModel.token.toString());

      return loginResponseModel;
    } catch (e) {
      handleError(e);
      throw Exception('Error in login: $e');
    }
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel entity) async {
    var body = entity.toJson();

    try {
      var response = await apiClient.postData("user/register", body,
          useBearerToken: false);

      var registerResponseModel = registerResponseModelFromJson(response);

      return registerResponseModel;
    } catch (e) {
      handleError(e);
      throw Exception('Error in login: $e');
    }
  }

  @override
  Future<bool> isLoggedIn() {
    return DatabaseHelper().isLoggedIn();
  }

  // for  user token
  // Future<bool> saveUserToken(String token) async {
  //   // return await PrefUtils().setAuthToken(token);
  //   return await DatabaseHelper().setAuthToken(token);
  // }

  //for get token
  @override
  Future<String> getUserToken() {
    return DatabaseHelper().getAuthToken();
  }

  // for  customer ID
  Future<bool?> saveCustomerData(LoginResponseModel customer) async {
    try {
      await DatabaseHelper().saveCustomerData(
        token: customer.token!,
        customerId: customer.user!.id!,
        customerName: customer.user!.name!,
        customerMail: customer.user!.email!,
      );

      return true;
    } catch (e) {
      print('Error saving customer data: $e');
      return false;
    }
  }

  //for get customer
  @override
  Future<LoginResponseModel> getCustomer() async {
    final Map<String, dynamic> result = await DatabaseHelper().getCustomer();

    if (result.isNotEmpty) {
      return LoginResponseModel(
        user: LoginUser(
          id: result['customerId'],
          name: result['customerName'],
          email: result['customerMail'],
        ),
        token: result['token'],
      );
    } else {
      // If no data is available, you might want to return an appropriate default or throw an exception.
      throw Exception('No customer data available');
    }
  }

  @override
  Future<bool> logout() async {
    try {
      var response = await apiClient.postData("user/logout", {});

      print(response);

      await DatabaseHelper().clearPreferencesData();
      return true;
    } catch (e) {
      handleError(e);
      throw Exception('Error in logout: $e');
    }
  }
}
