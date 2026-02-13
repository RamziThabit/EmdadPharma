import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  static Database? _db;

  Future<Database> get db async {
    _db = _db ?? await initializeDb();
    return _db!;
  }

  Future<Database> initializeDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'electronics-store.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
    );
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {


    print("---------------- onUpgrade -------------------");
  }

  Future<void> _onCreate(Database db, int version) async {
    try {
      await db.execute('''
          CREATE TABLE "cart" (
            "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            "name" TEXT NOT NULL,
            "price" REAL NOT NULL,
            "total" REAL NOT NULL,
            "image" TEXT NOT NULL,
            "description" TEXT,
            "quantity" INTEGER NOT NULL
          )
        ''');


      print("-------------------- onCreate ---------------");
    } catch (e) {
      print("Error creating table: $e");
    }
  }
//  readData("select * from carts where id = ?", [id])

  Future<List<Map>> readData(String sql,[List? parameters]) async {
    try {
      Database myDb = await db;
      return await myDb.rawQuery(sql,parameters);
    } catch (e) {
      print("Error reading data: $e");
      return [];
    }
  }

  Future<int> insertData(String sql,[List? parameters]) async {
    try {

      Database myDb = await db;
      return await myDb.rawInsert(sql,parameters);
    } catch (e) {
      print("Error inserting data: $e");
      return -1;
    }
  }

  Future<int> updateData(String sql,[List? parameters]) async {
    try {
      Database myDb = await db;
      return await myDb.rawUpdate(sql,parameters);
    } catch (e) {
      print("Error updating data: $e");
      return -1;
    }
  }

  Future<int> deleteData(String sql,[List? parameters]) async {
    try {
      Database myDb = await db;
      return await myDb.rawDelete(sql,parameters);
    } catch (e) {
      print("Error deleting data: $e");
      return -1;
    }
  }
  Future<void> clearTable() async {
    try {
      Database db = await DbService().db; 
      await db.execute('DELETE FROM cart');
      print("All data from 'cart' table has been deleted.");
    } catch (e) {
      print("Error clearing data: $e");
    }
  }

}