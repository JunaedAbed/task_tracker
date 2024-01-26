import 'package:task_tracker/core/errors/error_controller.dart';
import 'package:task_tracker/data/api/api_client.dart';
import 'package:task_tracker/data/services/task/task_repository_interface.dart';
import 'package:task_tracker/presentation/dashboard_screen/models/all_tasks_response_model.dart';

class TaskRepository with ErrorController implements TaskRepositoryInterface {
  final apiClient = ApiClient();

  @override
  Future<AllTasksResponseModel> getAllTasks() async {
    try {
      var response = await apiClient.getData("task");

      var allTasksResponseModel = allTasksResponseModelFromJson(response);

      return allTasksResponseModel;
    } catch (e) {
      handleError(e);
      throw Exception('Error in getAllTasks: $e');
    }
  }
}
