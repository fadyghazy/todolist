import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

import '../model/todomodel.dart';

class HelperNote {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  // create Database file
  initialDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "todoapp.db");
    var mydb = await openDatabase(path, version: 40, onCreate: _onCreate);
    return mydb;
  }

  // create Database Table
  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE todoapp1( id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE ,discription TEXT NOT NULL ,name TEXT NOT NULL,date TEXT NOT NULL ,done TEXT NOT NULL)");
  }

  Future<int> insertdb(Map<String, dynamic> data) async {
    Database? db_client = await db;
    var result = await db_client!.insert("todoapp1", data);
    return result;
  }

  Future<int> deletetodo(int id) async {
    Database? db_client = await db;
    var result =
    await db_client!.rawUpdate('DELETE FROM todoapp1 WHERE id ="$id"');
    return result;
  }

  Future<int> updatetodo(String discription, int id) async {
    Database? db_client = await db;
    var result = await db_client!.rawUpdate(
        'UPDATE todoapp1 SET discription ="$discription" WHERE id ="$id"');
    return result;
  }

  Future<List<StudentList>> gettodo() async {
    Database? db_client = await db;
    List<StudentList> list = [];
    var result = await db_client!.query('todoapp1');
    for (var i in result) {
      list.add(StudentList(
          id: i["id"],
          done: i["done"],
          discription: i["description"],
          name: i["name"],
          date: i["date"]));
    }

    return list;
  }

  Future<List> getSingleRaw(int id) async {
    Database? db_client = await db;
    var result = await db_client!.query('todoapp1', where: 'id ="$id"');
    return result;
  }
}
