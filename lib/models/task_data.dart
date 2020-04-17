import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todomobile/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Test"),
    Task(name: "Yo"),
  ];
  List<Task> selectTask = [];

  void addSelectTask(Task task) {
    selectTask.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  int get selectedTaskCount {
    return _tasks.where((task) => task.isSelected == true).length;
  }

  void addTask(String newTaskTitle) {
    final newTask = Task(name: newTaskTitle);
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask() {
    _tasks.removeWhere((task) => task.isSelected == true);
    notifyListeners();
  }

  bool _isSelected = false;
  bool get isSelected => _isSelected;

  changeState(bool status) {
    _isSelected = status;
    notifyListeners();
  }

  arrowBack() {
    _tasks.forEach((task) {
//        testing to see if there is any task is selected then will put it back to normal state
      if (task.isSelected == true) {
        task.toggleSelect();
      }
    });

    changeState(false);
  }

  selectState(Task task) {
    task.toggleSelect();
    notifyListeners();
  }
}
