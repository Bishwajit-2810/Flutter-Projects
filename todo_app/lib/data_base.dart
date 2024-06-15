import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todoList = [];
  final _myBox = Hive.box('myBox');
  void createInitialData() {
    todoList = [
      ["Welcome", true],
    ];
  }

  void loadData() {
    todoList = _myBox.get("List");
  }

  void updateDataBase() {
    _myBox.put("List", todoList);
  }
}
