import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class LocalDB {

  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        userId INTEGER,
        title TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<Database> db() async {
    return openDatabase(
      'local.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(int? userId, String? title) async {
    final db = await LocalDB.db();
    final data = {'title': title, 'userId': userId};
    final id = await db.insert('items', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await LocalDB.db();
    return db.query('items', orderBy: "id");
  }

  static Future<int> updateItem(
      int id, int? userId, String? title) async {
    final db = await LocalDB.db();

    final data = {
      'title': title,
      'userId': userId,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await LocalDB.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
