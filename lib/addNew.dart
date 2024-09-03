import 'package:flutter/material.dart';
import 'package:todo_app/Models/tasks.dart';
import 'package:todo_app/taps.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Color mango = Color(0xffffd37e);

  Color darkMango = Color(0xffeeb549);

  Color darkIndo = Color(0xff1e2b58);

  Color lightIndo = Color(0xff6e70c5);

  Color textColor = Color(0xffe3b43d);

  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thr'];

  late String dropdownValue = days[0];
  final titleController = TextEditingController();
  final decController = TextEditingController();
  final timeController = TextEditingController();
  final dayController = TextEditingController();

  Tasks newTask(){
    return  Tasks(
        title: titleController.text,
        todo: decController.text,
        time: timeController.text,
        day: dayController.text, isDone: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Task',
            style: TextStyle(
              color: Colors.yellow[100],
              fontWeight: FontWeight.bold,
              fontFamily: 'Source Sans Pro',
              fontSize: 28,
            ),
          ),
          backgroundColor: darkMango,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Text(
                    'Enter task title:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.yellow[100],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: titleController,
                  style: TextStyle(color: Colors.yellow[100]),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a New Task title',
                    hintStyle: TextStyle(color: Colors.yellow[100]),
                    label: Text(
                      'Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: textColor,
                      ),
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.title),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Text(
                    'Enter Task description:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.yellow[100],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: decController,
                  style: TextStyle(color: Colors.yellow[100]),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a New Task title',
                      hintStyle: TextStyle(color: Colors.yellow[100]),
                      label: Text(
                        'Title Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: textColor),
                      ),
                      labelStyle: TextStyle(color: textColor),
                      icon: Icon(Icons.description)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Text(
                    'Enter The Task Time:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.yellow[100],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: timeController,
                  style: TextStyle(color: Colors.yellow[100]),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a New Task Time',
                      hintStyle: TextStyle(color: Colors.yellow[100]),
                      label: Text(
                        'Time',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: textColor),
                      ),
                      labelStyle: TextStyle(color: textColor),
                      icon: Icon(Icons.access_time)),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(Icons.view_day),
                  title: Text(
                    'Choose The Day:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.yellow[100],
                    ),
                  ),
                  trailing: DropdownMenu(
                    controller: dayController,
                    initialSelection: days.first,
                    onSelected: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        days.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry(value: value, label: value);
                    }).toList(),
                    textStyle: TextStyle(color: Colors.yellow[100]),
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(mango),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkMango,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) {
                      return TodoScreen();
                    }));
                  },
                  child: Icon(
                    Icons.done,
                    size: 40,
                    color: mango,
                  ),
                )
              ],
            ),
          ),
        )
        // Implement the form to add a task here
        );
  }
}
