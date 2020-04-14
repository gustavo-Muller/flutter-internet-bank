import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createdatabase(String tableName) async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'agenda.db');

  return openDatabase(path, onCreate: (db, version) {
    db.execute(tableName);
  }, version: 1);
}