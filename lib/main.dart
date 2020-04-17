import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomobile/models/task.dart';
import 'package:todomobile/models/task_data.dart';
import 'package:todomobile/screens/home_screen.dart';
import 'package:todomobile/screens/tasks_screen.dart';

import 'package:todomobile/util/app_bar.dart';
import 'package:todomobile/values/bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
