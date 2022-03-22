

import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart';

class DatabaseHelper{

  static final _databaseName = "store.db";
  static final _databaseVersion = 1;
  static final table = 'my_table';
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';
  static final columnEmail = 'email';
  static final columnNumber = 'number';



  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;





  Future<Database?> get database async{

    if(_database== null){
      _database = await _iniDatabase();
    }
    return _database;
  }



  _iniDatabase() async {

    Directory data_directory = await getApplicationDocumentsDirectory();
    String path = join(data_directory.path,_databaseName);

    return await openDatabase(path,version: _databaseVersion,onCreate: _onCreate);


  }









  Future _onCreate(Database db, int version) async {

    await db.execute('''
     CREATE TABLE $table(
     $columnId INTEGER PRIMARY KEY,
     $columnName TEXT NOT NULL,
     $columnAge INTEGER NOT NULL,
     $columnEmail TEXT NOT NULL,
     $columnNumber INTEGER NOT NULL
     )
     ''');

  }


  Future <int> insert(Map<String, dynamic> row) async{
    Database? r_db = await instance.database;
    return await r_db!.insert(table, row);

  }


  Future <int> update(Map<String, dynamic> row) async{
    Database? r_db = await instance.database;
    int id = row[columnId];
    return await r_db!.update(table,row,where: '$columnId=?',whereArgs: [id]);

  }

  Future <int> delete(int id) async{
    Database? r_db = await instance.database;
    return await r_db!.delete(table,where: '$columnId=?',whereArgs: [id]);
  }

  Future<int?> queryRowCount()async{
    Database ? _db = await instance.database;
    return Sqflite.firstIntValue(await _db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }



}

