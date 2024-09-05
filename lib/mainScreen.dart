import 'todosAndAddTodo.dart';
import 'package:flutter/material.dart';
import 'Models/colors.dart';

class ToDo extends StatefulWidget {
  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TO-DO List',
            style: TextStyle(
                fontFamily: 'Source Sans Pro',
                letterSpacing: 2.5,
                color: white_,
                fontWeight: FontWeight.bold,
                fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: dark_green,
      ),
      backgroundColor:white_,
      body: TodoScreen(),
      floatingActionButton: FloatingActionButton(backgroundColor: white_green,
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
            return AddTaskScreen();
          }));

        },
        child: Icon(
          Icons.add,
          color: white_,
          size: 45,
        ),
      ),
    );
  }
}
