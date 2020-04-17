import 'package:flutter/material.dart';
import 'package:todomobile/models/task.dart';
import 'package:todomobile/models/task_data.dart';
import 'package:provider/provider.dart';

class MyBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final preferredSize = Size(0, 60);

  Widget build(BuildContext context) {
    AppBar selectBar = AppBar(
        title: Text(
            "${Provider.of<TaskData>(context).selectedTaskCount} Item selected"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () =>
                Provider.of<TaskData>(context, listen: false).arrowBack()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () =>
                Provider.of<TaskData>(context, listen: false).deleteTask(),
          )
        ]);
    AppBar defaultBar = AppBar(
      title: Text('Welcome Dong'),
      leading: Icon(Icons.menu),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );

    return Provider.of<TaskData>(context).isSelected ? selectBar : defaultBar;
  }
}
