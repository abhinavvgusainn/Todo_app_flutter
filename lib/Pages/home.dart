import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:todo_app/Controllers/todocontroller.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TodoController todoController = Get.put(TodoController());
  List _todo = [
    "Supermarket noon",
    "30 Min workout",
    "Complete todo app",
  ];
  void addTodo() {
    Get.defaultDialog(
      backgroundColor: Colors.brown[100],
      title: 'Add a new Todo',
      content: TextField(
        onChanged: (value) {
          todoController.newString.value = value;
        },
      ),
      confirm: GestureDetector(
        onTap: () {
          setState(() {
            _todo.add(todoController.newString.value);
          });
          Navigator.of(context).pop();
        },
        child: Icon(Icons.task_alt),
      ),
      cancel: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.cancel_outlined)),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _todo.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            _todo[index],
          ),
          trailing: GestureDetector(
            onTap: () => setState(() {
              _todo.removeAt(index);
            }),
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(padding: EdgeInsets.all(30)),
          FloatingActionButton(
            onPressed: () => addTodo(),
            child: Icon(Icons.add),
          ),
          SizedBox(width: 13),
          FloatingActionButton(
            onPressed: () => Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
            ),
            child: Icon(
              Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
          )
        ],
      ),
    );
  }
}
