import 'package:to_do_app/app/data/modules/task.dart';
import 'package:to_do_app/app/data/providers/task/provider.dart';

class  TaskRepository{
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> readTask()=> taskProvider.readTask();

  void writeTasks(List<Task> tasks)=>taskProvider.writeTasks(tasks);
}