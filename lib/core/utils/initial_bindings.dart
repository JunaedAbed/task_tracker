import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/data/api/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put<GetConnect>(GetConnect());
    Get.put<ApiClient>(ApiClient());
  }
}
