import 'package:flutter/material.dart';
import 'package:todomobile/util/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:todomobile/models/task_data.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function selectCallback;
  final bool isSelected;
  TasksTile(
      {this.taskTitle,
      this.isChecked,
      this.checkboxCallback,
      this.selectCallback,
      this.isSelected});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: selectCallback,
        leading: Checkbox(
          activeColor: Colors.green,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
        title: Text(taskTitle,
            style: TextStyle(
                backgroundColor: Colors.transparent,
                decoration: isChecked ? TextDecoration.lineThrough : null)));
  }
}
