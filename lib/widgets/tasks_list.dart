import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomobile/widgets/task_tile.dart';
import 'package:todomobile/models/task_data.dart';
import 'package:todomobile/util/app_bar.dart';
import 'package:todomobile/screens/selectedTask_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
//      taskData is a name of object from class TaskData in task_data model.
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return taskData.tasks.any((task) => task.isSelected == true)
                ? SelectedTasksTile(
                    taskTitle: taskData.tasks[index].name,
                    selectCallback: () {
                      taskData.selectState(taskData.tasks[index]);
                    },
                    isSelected: taskData.tasks[index].isSelected,
                  )
                : TasksTile(
                    taskTitle: taskData.tasks[index].name,
                    isChecked: taskData.tasks[index].isDone,
                    selectCallback: () {
                      if (taskData.tasks[index].isDone == false) {
                        taskData.selectState(taskData.tasks[index]);
                        taskData.changeState(true);
                      }
                    },
                    isSelected: taskData.tasks[index].isSelected,
                    checkboxCallback: (checkboxState) {
                      taskData.updateTask(taskData.tasks[index]);
                    },
                  );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
