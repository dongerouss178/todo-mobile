import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomobile/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10, right: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What do you want to do?',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                  ),
                  autofocus: true,
                  textAlign: TextAlign.left,
                  onChanged: (newText) {
                    newTaskTitle = newText;
                  },
                  onSubmitted: (newText) {
                    if (newText == "") {
                      Navigator.pop(context);
                    } else {
                      taskData.addTask(newText);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                    ),
                    IconButton(
                      icon: Icon(Icons.dehaze),
                    ),
                    IconButton(
                      icon: Icon(Icons.flag),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        if (newTaskTitle != null) {
                          taskData.addTask(newTaskTitle);
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          color: Theme.of(context).canvasColor,
        ),
      );
    });
  }
}
