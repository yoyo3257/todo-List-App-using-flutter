import 'taps.dart';
import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  Color mango = Color(0xffffd37e);

  Color darkMango = Color(0xffeeb549);

  Color darkIndo = Color(0xff1e2b58);

  Color lightIndo = Color(0xff6e70c5);

  Color textColor = Color(0xffe3b43d);

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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: darkMango,
        ),
        backgroundColor: Colors.black,
        body: TodoScreen(),
        floatingActionButton:FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) {
                return AddTaskScreen();
              }));
            });
          },
          child: Icon(
            Icons.add,
            color: darkMango,
           size: 45,
          ),
        ),);
  }
}
