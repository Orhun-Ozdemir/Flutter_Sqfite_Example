import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hello_app/models/ogrenci.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static DataBaseHelper _dataBaseHelper;
  static Database _database;

  String _ogrenciTable = "ogrenci";
  String _columnname = "name";
  String _columnsurname = "surname";
  String _columnid = "id";

  factory DataBaseHelper() {
    if (_dataBaseHelper == null) {
      print("Database boş ");
      return _dataBaseHelper = DataBaseHelper._internal();
    } else {
      print("Database boş değil geri döndürüldü");
      return _dataBaseHelper;
    }
  }

  DataBaseHelper._internal();

  Future<Database> _getDataBase() async {
    if (_database == null) {
      print("DataBase null");
      return _database = await _InitializeDataBase();
    } else {
      return _database;
    }
  }

  _InitializeDataBase() async {
    Directory klasor = await getApplicationDocumentsDirectory();
    String dbpath = join(klasor.path, "ogrenci.db");
    debugPrint("Db path" + dbpath);

    var ogrencidb = openDatabase(dbpath, version: 1, onCreate: _createDb);
    return ogrencidb;
  }

  FutureOr<void> _createDb(Database db, int verison) async {
    print("DataBase Oluşturuluyor");
    await db.execute(
        "CREATE TABLE $_ogrenciTable($_columnid INTEGER    PRIMARY KEY AUTOINCREMENT, $_columnname TEXT ,$_columnsurname TEXT)");
  }

  ogrenciEkle(Ogrenci ogrenci) async {
    var db = await _getDataBase();

    var value =
        db.insert(_ogrenciTable, ogrenci.toMap(), nullColumnHack: _columnid);
  }

  ogrenciSil(Ogrenci ogrenci) async {
    var db = await _getDataBase();
    
    var value=db.delete(_ogrenciTable,where: _columnid,whereArgs: ogrenci.)
  }
}
