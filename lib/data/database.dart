import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  // reference box
  final _myBox = Hive.box('mybox');

  // run this method if this is the first time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false]
    ];
  }

  // load data
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update data
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
