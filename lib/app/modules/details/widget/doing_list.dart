import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/core/utils/extension.dart';
import 'package:to_do_app/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final homectrl = Get.find<Homecontroller>();
  DoingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homectrl.doingTodos.isEmpty && homectrl.doneTodos.isEmpty
          ? Column(
              children: [
                SizedBox(height: 10.0.hp,),
                Image.asset(
                  "assets/to-do-list.png",
                  fit: BoxFit.cover,
                  width: 65.0.wp,
                ),
                Text(
                  "Add Task",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.sp,
                  ),
                )
              ],
            )
          : ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...homectrl.doingTodos
                    .map((element) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0.wp, horizontal: 9.0.wp),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) => Colors.grey,
                                    ),
                                    value: element['done'],
                                    onChanged: (value) {
                                      homectrl.doneTodo(element['title']);
                                    }),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.0.wp),
                                child: Text(
                                  element['title'],
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
                if (homectrl.doingTodos.isNotEmpty)
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.0.wp),
                    child: const Divider(
                      thickness: 2,
                    ),
                  ),
              ],
            ),
    );
  }
}
