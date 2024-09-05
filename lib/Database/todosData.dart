import 'package:sqflite/sqflite.dart';

class UserDatabase {
  late Database d;
  late List<Map> users = [];
  createDatabaseAndTable() async {
    d = await openDatabase('p.db', version: 1, onCreate: (data, i) async {
      await data.execute('create table user '
          '(id integer primary key, '
          'title text,'
          ' todo text '
          ',time text, '
          'day text,'
          ' isDone integer)');
      print('Table Created !!');
    }, onOpen: (data) {
      print('DATABASE OPEN');
    });
    getUser().then((value) {
      users = value;
      print(users);
    });
  }

  insertUser({
    required String title,
    required String todo,
    required String time,
    required String day,
  }) async {
    d.transaction((txn) async {
      await txn.rawInsert(
          "insert into user (title,todo,time,day, isDone)values (?,?,?,?,?)",
          [title, todo, time, day, 0]).then((value) {
        print('The Row $value inserted ');
      });
    });
  }

  Future<List<Map>> getUser() async {
    return await d.rawQuery("select * from user");
  }

  updateUser(
      {required String title,
      required String todo,
      required String time,
      required String day,
      required int id}) async {
    d
        .rawUpdate(
            "Update user set title='$title', todo='$todo', time='$time' where id=$id")
        .then((value) {
      print('User updated');
    });
  }

  userDelete({required int id}) async {
    d.rawDelete("delete from user where id=$id").then((value) {
      print('Deleted user $value');
    });
  }

  // refresh() async {
  //   await getUser().then((value) {
  //     users = value;
  //     print(users);
  //   });
  // }
}
