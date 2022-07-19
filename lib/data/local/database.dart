import 'dart:io';

import 'package:notes_app/core/utils/consts.dart';
import 'package:notes_app/data/models/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NProvider {
  NProvider._();

  static final NProvider db = NProvider._();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDB();

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}Notes.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $notesTable($columnId STRING NOT NULL ,$columnTitle VARCHAR(255) NOT NULL,$columnDescription VARCHAR(255) NOT NULL)');
  }

  //READ
  Future<List<Note>> getNotes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> noteMapList = await db.query(notesTable);
    final List<Note> notesList = [];
    for (var noteMap in noteMapList) {
      notesList.add(Note.fromMap(noteMap));
    }
    return notesList;
  }

  //Insert
  Future<void> insertNote(Note note) async {
    final db = await database;
    await db.insert(
      notesTable,
      note.toMap(),
    );
  }

  //UPDATE
  Future<void> updateNote(String id, Note note) async {
    final db = await database;
    await db.update(notesTable, note.toMap(), where: 'id = ?', whereArgs: [id]);
  }

  //DELETE
  Future<void> deleteNote(String id) async {
    final db = await database;
    await db.delete(
      notesTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
