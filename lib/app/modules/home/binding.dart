import 'package:get/get.dart';
import 'package:to_do_app/app/data/providers/task/provider.dart';
import 'package:to_do_app/app/data/services/storage/repository.dart';
import 'package:to_do_app/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => Homecontroller(
        taskRepository: TaskRepository(taskProvider: TaskProvider()),
      ),
    );
  }
}
