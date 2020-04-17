import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomobile/widgets/tasks_list.dart';
import 'package:todomobile/screens/add_task_screen.dart';
import 'package:todomobile/models/task_data.dart';
import 'package:todomobile/util/app_bar.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
            isScrollControlled: true,
//            useRootNavigator: true,
          );
        },
      ),
      appBar: MyBar(),
      body: Container(
        child: TasksList(),
//        ]),
      ),
    );
  }
}
