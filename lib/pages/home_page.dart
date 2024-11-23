import 'package:flutter/material.dart';
import 'package:testapp/util/dialog_box.dart';
import 'package:testapp/util/todo_tile.dart';
import 'package:testapp/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //reference hive box
  final _myBox = Hive.box('mybox');

  // text controller
  final _controller = TextEditingController();

  // list of to do tasks
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // create default data for first time opening

    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // data exists
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel:() => Navigator.of(context).pop(),
          );
        }
    );
    db.updateData();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteTask (int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 193, 220),
        appBar: AppBar(
          title: const Center(child: Text("TO DO")),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFCB9DF0),
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),

        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteTask: (context) => deleteTask(index),
            );
          },
        )
    );
  }
}