import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ejemplo_disenos_firebase/global/environment.dart';
import 'package:ejemplo_disenos_firebase/providers/data/shp.dart';

class Dbase {
  static Database? _database;
  static final Dbase _db = new Dbase._();

  final _shp = new Shp();

  Dbase._();

  factory Dbase() {
    return _db;
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await iniDB();
    return _database;
  }

  Future<Database> iniDB() async {
    //Path donde esta la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, Environment.dbase);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE ${Environment.tableUsuarios}(
        Id TEXT,
        email TEXT,
        password TEXT, PRIMARY KEY(Id)
      )''');
      await db.execute('''CREATE TABLE ${Environment.tableFiguras}(
        Id TEXT,
        idFirebase TEXT,
        forma TEXT, 
        rgb TEXT, 
        PRIMARY KEY(Id)
      )''');
    });
  }
}
