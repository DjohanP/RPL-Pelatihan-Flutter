import 'dart:async';
import 'dart:io';//directory
import 'package:noterpl/note.dart';
import 'package:path/path.dart';//join
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

final String TABLE_NAME = "notes";
final String ID = "_id";
final String TITLE = "title";
final String DESCRIPTION = "description";

class DatabaseNote{
  Database _database;
  Future opendb() async{
    if (_database == null) {
      Directory directory=await getApplicationDocumentsDirectory();
      _database=await openDatabase(
        join(directory.path,"notes.db"),
        version: 1,
        onCreate: (Database db,int version)async{
          await db.execute(
            '''create table $TABLE_NAME ( 
            $ID integer primary key autoincrement, 
            $TITLE text not null,
            $DESCRIPTION text not null)'''
          );
        }
      );
    }
  }

  Future<int> insertNote(Note note)async{
    await opendb();
    return await _database.insert(TABLE_NAME, note.toMap());
  }

  Future<List<Note>> getNotes() async {
    await opendb();
    List<Map> entities = await _database.rawQuery("select * from $TABLE_NAME");
    return entities.map((map) => new Note.fromMap(map)).toList();
  }

  Future deleteNote(int id) async {
    await opendb();
    await _database.delete(TABLE_NAME, where: "$ID = ?", whereArgs: [id]);
  }

  Future updateNote(Note note) async {
    await opendb();
    await _database.update(TABLE_NAME, note.toMap(), where: "$ID = ?", whereArgs: [note.id]);
  }

  closeDb() {
    _database.close();
  }
}