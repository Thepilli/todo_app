import 'package:sqflite/sqflite.dart';

class DBHelper {
  const DBHelper._();

  static Future<void> createTables(Database database) async {
    await database.execute(
      'CREATE TABLE tasks('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'title STRING, '
      'description TEXT, '
      'date STRING, '
      'startTime STRING, '
      'endTime STRING, '
      'remind INTEGER, '
      'isCompleted INTEGER, '
      'repeat STRING, '
      ')',
    );

    await database.execute(
      'CREATE TABLE users('
      'id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, '
      'isVerified INTEGER DEFAULT 0'
      ')',
    );
  }

  static Future<Database> db() async {
    return openDatabase('todo.db', version: 1, onCreate: (database, _) async {
      await createTables(database);
    });
  }


  ///TASKS
  



  ///USERS

  static Future<void> createUser({required bool isVerified}) async {
    final localDb = await db();

    final data = {'id': 1, 'isVerified': isVerified ? 1 : 0};

    await localDb.insert('users', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> userExists() async {
    final localDb = await db();
    final userData = await localDb.query('users');
    return userData.isNotEmpty;
  }

  static Future<void> deleteUser() async {
    final localDb = await db();
    await localDb.delete('users');
  }
}
