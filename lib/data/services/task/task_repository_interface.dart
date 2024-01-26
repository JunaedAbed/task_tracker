import 'package:task_tracker/presentation/dashboard_screen/models/all_tasks_response_model.dart';

abstract class TaskRepositoryInterface {
  Future<AllTasksResponseModel> getAllTasks();
}
