import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_todo_manabie/core/values/app_constant.dart';
import 'package:test_todo_manabie/data/models/task_model.dart';

class TodoDB{
  static late Database db;

  static Future open(String path) async {
    db = await openDatabase(join(await getDatabasesPath(), path), version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
create table ${AppConstant.TASKS_TABLE} ( 
  ${TaskModel.task_id} integer primary key autoincrement, 
  ${TaskModel.task_title} text not null,
  ${TaskModel.task_isDone} integer not null)
''');
        });
  }
  static Future close()async => db.close();
}
