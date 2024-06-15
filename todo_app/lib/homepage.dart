import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data_base.dart';
import 'package:todo_app/dialog_box.dart';
import 'package:todo_app/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  final _newTask = TextEditingController();
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    if (_myBox.get('List') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void boxChanged(int index, bool? value) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      db.updateDataBase();
    });
  }

  void saveTask() {
    setState(() {
      db.todoList.add([_newTask.text, false]);
      db.updateDataBase();
    });
    _newTask.clear();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    db.todoList.removeAt(index);
    setState(() {
      db.updateDataBase();
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            newTask: _newTask,
            onSave: saveTask,
            onCancel: () {
              _newTask.clear();
              Navigator.of(context).pop();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "TO DO",
          style: TextStyle(),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoList(
            taskCompleted: db.todoList[index][1],
            taskName: db.todoList[index][0],
            onChanged: (p0) {
              boxChanged(index, db.todoList[index][1]);
            },
            deleteTask: (p1) {
              deleteTask(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
