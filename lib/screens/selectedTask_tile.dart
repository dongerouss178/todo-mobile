import 'package:flutter/material.dart';

class SelectedTasksTile extends StatelessWidget {
  final String taskTitle;
  final Function selectCallback;
  final bool isSelected;

  SelectedTasksTile({this.taskTitle, this.selectCallback, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          selectCallback();
        },
        child: ListTile(
          leading: isSelected
              ? Icon(
                  Icons.radio_button_checked,
                  color: Colors.green,
                )
              : Icon(
                  Icons.radio_button_unchecked,
                ),
          title: Text(taskTitle,
              style: TextStyle(
                backgroundColor: Colors.transparent,
              )),
        ));
  }
}
