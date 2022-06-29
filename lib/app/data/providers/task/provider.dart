import 'dart:convert';
import 'package:get/get.dart';
import 'package:to_do_app/app/core/utils/key.dart';
import 'package:to_do_app/app/data/modules/task.dart';
import 'package:to_do_app/app/data/services/storage/services.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

//store data like this methord

// {'tasks':[
//   {
//     'title': 'work',
//     'color':'#ff123456',
//     'icon':0xe123
//   }
// ]}


  List<Task> readTask() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks){
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
