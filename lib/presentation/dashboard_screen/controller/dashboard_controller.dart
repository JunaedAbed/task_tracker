import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/data/services/task/task_repository.dart';
import 'package:task_tracker/data/services/task/task_repository_interface.dart';

class DashboardController extends GetxController {
  final TaskRepositoryInterface _taskRepo = TaskRepository();

  @override
  void onInit() {
    getAllTasks();
    super.onInit();
  }

  void getAllTasks() async {
    var res = await _taskRepo.getAllTasks();

    print(res);
  }
}
