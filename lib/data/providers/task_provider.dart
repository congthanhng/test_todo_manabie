import 'package:test_todo_manabie/data/models/task_model.dart';

abstract class TaskProvider {

  Future<TaskModel> insert(TaskModel task);

  Future<List<TaskModel>> getTasks();

  Future<TaskModel?> getTaskById(int id);

  Future<int> delete(int id);

  Future<int> update(TaskModel task);

}
