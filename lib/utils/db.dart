// ignore_for_file: unnecessary_null_comparison

import 'package:first_app/utils/db_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _db;
  Future<Database> get database async => _db ?? await _initDatabase();
  Future<Database> _initDatabase() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, 'todo.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text ,
  $columnDate text ,
  $columnDescription text ,
  $columnDone integer)
''');
    });
  }

  Future<Todo> insert(Todo todo) async {
    try {
      Database db = await instance.database;
      todo.id = await db.insert(tableTodo, todo.toMap());
    } catch (e) {
      // print(e);
    }
    return todo;
  }

  Future<List<Todo>> getTodoListByDate(String date) async {
    Database db = await instance.database;
    List<Map<String, dynamic>>? maps = await db.query(tableTodo,
        columns: [
          columnId,
          columnDone,
          columnTitle,
          columnDescription,
          columnDate,
        ],
        where: '$columnDate = ?',
        whereArgs: [date]);

    List<Todo> list =
        maps.isNotEmpty ? maps.map((e) => Todo.fromMap(e)).toList() : [];
    return list;
  }

  // Future<List<Todo>> getTodoList(String date) async {
  //   Database db = await instance.database;
  //   List<Map<String, dynamic>>? maps = await db.query(tableTodo,
  //       columns: [
  //         columnId,
  //         columnDone,
  //         columnTitle,
  //         columnDescription,
  //         columnDate,
  //       ],
  //       where: '$columnDate = ?',
  //       whereArgs: [date]);

  //   List<Todo> list =
  //       maps.isNotEmpty ? maps.map((e) => Todo.fromMap(e)).toList() : [];
  //   return list;
  // }

  Future<Todo?> getTodo(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>>? maps = await db.query(tableTodo,
        columns: [
          columnId,
          columnDone,
          columnTitle,
          columnDescription,
          columnDate,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);

    if ((maps == null ? 0 : maps.length) > 0) {
      return Todo.fromMap(maps == null ? {} : maps.first);
    }
    return null;
  }

  Future<int?> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int?> update(Todo todo) async {
    Database db = await instance.database;
    return await db.update(tableTodo, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => (await instance.database).close();
}
