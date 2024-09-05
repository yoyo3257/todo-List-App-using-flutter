import 'package:flutter/material.dart';
import 'package:todo_app/Database/todosData.dart';
import 'mainScreen.dart';
import 'todoEdit.dart';
import 'Models/colors.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  UserDatabase u = UserDatabase();
  late List l = doneList();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    await u.createDatabaseAndTable();
    setState(() {});
  }

  doneList() {
    List doneList = [];
    for (int i = 0; i < u.users.length; i++) {
      if (u.users[i]['isDone'] == 0) {
        doneList.add(true);
      } else {
        doneList.add(false);
      }
    }
    return doneList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < u.users.length; i++)
              ListTile(
                title: Text(
                  u.users[i]['title'],
                  style: TextStyle(
                      color: dark_green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                leading: TextButton(
                  onPressed: () {
                    setState(() {
                      l[i] = !l[i];
                    });
                  },
                  child: Icon(
                    (l[i] == false)
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank,
                    size: 30,
                    color: white_green,
                  ),
                ),
                subtitle: Column(
                  children: [
                    Text(
                      u.users[i]['todo'],
                      style: TextStyle(color: dark_green, fontSize: 18),
                      // textAlign: TextAlign.start,
                    ),
                    Divider(
                      color: white_green,
                      height: 10,
                    )
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await u.userDelete(id: u.users[i]['id']);
                        print('user deleted');
                        await u.getUser().then((value) {
                          u.users = value;
                          print(u.users);
                        });
                        setState(() {});
                      },
                      child: Icon(
                        Icons.delete,
                        color: white_green,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (c) {
                          return Edit(user: u.users[i], u: u);
                        }));
                      },
                      child: Icon(
                        Icons.edit,
                        color: white_green,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thr'];
  UserDatabase u = UserDatabase();
  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  //
  Future<void> _fetchUsers() async {
    await u.createDatabaseAndTable();
    setState(() {});
  }

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
              color: white_,
              fontWeight: FontWeight.bold,
              fontFamily: 'Source Sans Pro',
              fontSize: 28,
            ),
          ),
          backgroundColor: dark_green,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          color: white_,
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
                      color: dark_green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: titleController,
                  style: TextStyle(color: dark_green),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a New Task title',
                    hintStyle: TextStyle(color: white_green),
                    label: Text(
                      'Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: textColor,
                      ),
                    ),
                    labelStyle: TextStyle(color: dark_green),
                    icon: Icon(
                      Icons.title,
                      color: white_green,
                    ),
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
                      color: dark_green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: decController,
                  style: TextStyle(color: dark_green),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a New Task title',
                    hintStyle: TextStyle(color: white_green),
                    label: Text(
                      'Title Description',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: textColor),
                    ),
                    labelStyle: TextStyle(color: textColor),
                    icon: Icon(
                      Icons.description,
                      color: white_green,
                    ),
                  ),
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
                      color: dark_green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: timeController,
                  style: TextStyle(color: dark_green),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a New Task Time',
                    hintStyle: TextStyle(color: white_green),
                    label: Text(
                      'Time',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: textColor),
                    ),
                    labelStyle: TextStyle(color: textColor),
                    icon: Icon(
                      Icons.access_time,
                      color: white_green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.view_day,
                    color: white_green,
                  ),
                  title: Text(
                    'Choose The Day:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: dark_green,
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
                    textStyle: TextStyle(color: dark_green),
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(white_),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dark_green,
                  ),
                  onPressed: () async {
                    u.insertUser(
                        title: titleController.text,
                        todo: decController.text,
                        time: timeController.text,
                        day: dayController.text);
                    await u.getUser().then((value) {
                      u.users = value;
                      print(u.users);
                    });
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (c) {
                      return ToDo();
                    }));
                  },
                  child: Icon(
                    Icons.done,
                    size: 40,
                    color: white_,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
