import 'package:test_todo_manabie/data/models/task_model.dart';

class HomeData {
  final List<TaskModel> allTask;
  final List<TaskModel> completeTasks;
  final List<TaskModel> inCompleteTasks;

  HomeData({
    List<TaskModel>? allTask,
    List<TaskModel>? completeTasks,
    List<TaskModel>? inCompleteTasks,
  })  : allTask = allTask ?? [],
        completeTasks = completeTasks ?? [],
        inCompleteTasks = inCompleteTasks ?? [];

  HomeData copyWith(
      {List<TaskModel>? allTask,
      List<TaskModel>? completeTasks,
      List<TaskModel>? inCompleteTasks}) {
    return HomeData(
        allTask: allTask ?? [...this.allTask],
        completeTasks: completeTasks ?? [...this.completeTasks],
        inCompleteTasks: inCompleteTasks ?? [...this.inCompleteTasks]);
  }
}
