import 'package:flutter/material.dart';
import 'todo_app.dart';
import 'Models/tasks.dart';

Color mango = Color(0xffffd37e);

Color darkMango = Color(0xffeeb549);

Color darkIndo = Color(0xff1e2b58);

Color lightIndo = Color(0xff6e70c5);

Color textColor = Color(0xffe3b43d);

List<Tasks> todolist = [
  Tasks(
      title: 'Cleaning',
      todo: 'Clean the room',
      time: '9:00',
      day: 'Sun',
      isDone: true),
  Tasks(
      title: 'Study',
      todo: 'Study lecture 1-3',
      time: '3:30',
      day: 'Mon',
      isDone: true),
  Tasks(
      title: 'WorkOut',
      todo: 'workout for 20 min',
      time: '10:00',
      day: 'Tue',
      isDone: true),
  Tasks(
      title: 'Reading',
      todo: 'complete the mysteries guest',
      time: '7:00',
      day: 'Wed',
      isDone: true),
  Tasks(
      title: 'Cooking',
      todo: 'cook the dinner ',
      time: '5:00',
      day: 'Thr',
      isDone: true),
];

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < todolist.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    todolist[i].title,
                    style: TextStyle(
                        color: Colors.yellow[100],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  leading: MaterialButton(
                      onPressed: () {
                        setState(() {
                          todolist[i].isDone = !todolist[i].isDone;
                        });
                      },
                      child: Icon(
                        (todolist[i].isDone == false)
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank,
                        size: 30,
                        color: Colors.white,
                      )),
                  subtitle: Column(
                    children: [
                      Text(
                        todolist[i].todo,
                        style:
                            TextStyle(color: Colors.yellow[100], fontSize: 18),
                        // textAlign: TextAlign.start,
                      ),
                      Divider(
                        color: Colors.yellow[50],
                        height: 10,
                      )
                    ],
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      setState(() {
                        todolist.remove(todolist[i]);
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.yellow[100],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thr'];

  late String dropdownValue = days[0];
  final titleController = TextEditingController();
  final decController = TextEditingController();
  final timeController = TextEditingController();
  final dayController = TextEditingController();

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
                    setState(() {
                      todolist.add(Tasks(
                        title: titleController.text,
                        todo: decController.text,
                        time: timeController.text,
                        day: dayController.text,
                        isDone: true,
                      ));
                      Navigator.pop(context);

                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (c) {
                        return ToDo();
                      }));
                    });
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
        ));
  }
}
