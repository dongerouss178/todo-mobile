class Task {
  final String name;
  bool isDone;
  bool isSelected;

//  Todo Add duedate and other property later
  Task({this.name, this.isDone = false, this.isSelected = false});

//  create a method in this class called toggleDone
  void toggleDone() {
    isDone = !isDone;
  }

  void toggleSelect() {
    isSelected = !isSelected;
  }
}
