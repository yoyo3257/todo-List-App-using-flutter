import 'package:flutter/material.dart';
import 'package:todo_app/mainScreen.dart';
import 'Database/todosData.dart';
import 'Models/colors.dart';

// you should update this in the future
class Edit extends StatefulWidget {
  Map user = {};
  UserDatabase u = UserDatabase();

  Edit({required this.user, required this.u});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  var titleController = TextEditingController();
  var decController = TextEditingController();
  var timeController = TextEditingController();
  var dayController = TextEditingController();

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.user['title']);
    decController = TextEditingController(text: widget.user['todo']);
    timeController = TextEditingController(text: widget.user['time']);
    dayController = TextEditingController(text: widget.user['day']);
  }

  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thr'];
  late String dropdownValue = days[0];

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
                  hintStyle: TextStyle(color: dark_green),
                  label: Text(
                    'Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                  labelStyle: TextStyle(color: dark_green),
                  icon: Icon(Icons.title,color: white_green,),
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
                    hintStyle: TextStyle(color: dark_green),
                    label: Text(
                      'Title Description',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: textColor),
                    ),
                    labelStyle: TextStyle(color: textColor),
                    icon: Icon(Icons.description,color: white_green,),),
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
                    hintStyle: TextStyle(color:dark_green),
                    label: Text(
                      'Time',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: textColor),
                    ),
                    labelStyle: TextStyle(color: textColor),
                    icon: Icon(Icons.access_time,color: white_green,),),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.view_day,color: white_green,),
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
                  onSelected: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries:
                      days.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry(value: value, label: value);
                  }).toList(),
                  textStyle: TextStyle(color:dark_green),
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
                  await widget.u.updateUser(
                      id: widget.user['id'],
                      title: titleController.text,
                      todo: decController.text,
                      time: timeController.text,
                      day: '');
                  await widget.u.getUser().then((value) {
                    widget.u.users = value;
                    print(widget.u.users);
                  });
                  print('updated');
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
      ),
    );
  }
}
