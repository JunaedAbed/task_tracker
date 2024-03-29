import 'dart:convert';

import 'package:task_tracker/core/app_export.dart';

class ApiClient extends GetConnect implements GetxService {
  String? bearerToken;

  @override
  String? get baseUrl => "https://api-todo-list.jotno.dev";

  final GetConnect connect = Get.find<GetConnect>();

  ApiClient() {
    initBearerToken();
  }

  Future<void> initBearerToken() async {
    bearerToken = await DatabaseHelper().getAuthToken();
  }

  Future<dynamic> getData(String endpoint) async {
    try {
      print('$baseUrl/$endpoint');
      print('Request Token: $bearerToken');

      final response = await connect.get(
        '$baseUrl/$endpoint',
        headers: {
          'Authorization': 'Bearer ${bearerToken ?? ''}',
        },
      );
      return _processResponse(response);
    } catch (e) {
      print("Error in getData: $e");
      throw e;
    }
  }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data,
      {bool useBearerToken = true}) async {
    try {
      print('Request Data: ${json.encode(data)}');

      final headers = useBearerToken
          ? {
              'Authorization': 'Bearer ${bearerToken ?? ''}',
            }
          : {};

      Response response = await connect.post(
        '$baseUrl/$endpoint',
        json.encode(data),
        headers: headers.cast<String, String>(),
      );
      var responseJson = _processResponse(response);
      return responseJson;
    } catch (e) {
      print("Error in postData: $e");
      throw e;
    }
  }
}

_processResponse(Response response) async {
  switch (response.statusCode) {
    case 200:
      var resJson = response.bodyString!;
      print(resJson);
      return resJson;
    case 201:
      var resJson = response.bodyString!;
      return resJson;
    case 400:
      throw BadRequestException(
          response.bodyString!, response.request?.url.toString());
    case 401:
      final Map<String, dynamic> errorData = json.decode(response.bodyString!);
      final String errorMessage = errorData['errors']['message'];
      throw UnauthorizedException(
          errorMessage, response.request?.url.toString());
    case 404:
      final Map<String, dynamic> errorData = json.decode(response.bodyString!);
      final String errorMessage = errorData['errors']['message'];
      throw DataNotFoundException(
          errorMessage, response.request?.url.toString());
    case 500:
    default:
      throw FetchDataException(
          "Error occured with code: ${response.statusCode}",
          response.request?.url.toString());
  }
}
