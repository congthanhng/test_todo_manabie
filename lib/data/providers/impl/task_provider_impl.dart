import 'package:sqflite/sqflite.dart';
import 'package:test_todo_manabie/core/values/app_constant.dart';
import 'package:test_todo_manabie/data/models/task_model.dart';
import 'package:test_todo_manabie/data/providers/database.dart';
import 'package:test_todo_manabie/data/providers/task_provider.dart';

class TaskProviderImpl extends TaskProvider{

  @override
  Future<TaskModel> insert(TaskModel task) async {
    task.taskId = await TodoDB.db.insert(AppConstant.TASKS_TABLE, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return task;
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    List<Map<String, dynamic>> results = await TodoDB.db.query(AppConstant.TASKS_TABLE);
    return results.map((e) => TaskModel.fromMap(e)).toList();
  }

  @override
  Future<TaskModel?> getTaskById(int id) async {
    List<Map<String, dynamic>> maps = await TodoDB.db.query(AppConstant.TASKS_TABLE,
        columns: [
          TaskModel.task_id,
          TaskModel.task_title,
          TaskModel.task_isDone
        ],
        where: '${TaskModel.task_id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return TaskModel.fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<int> delete(int id) async {
    return await TodoDB.db.delete(AppConstant.TASKS_TABLE,
        where: '${TaskModel.task_id} = ?', whereArgs: [id]);
  }

  @override
  Future<int> update(TaskModel task) async {
    return await TodoDB.db.update(AppConstant.TASKS_TABLE, task.toMap(),
        where: '${TaskModel.task_id} = ?', whereArgs: [task.taskId]);
  }
}