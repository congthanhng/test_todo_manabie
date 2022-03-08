part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class TaskDataLoaded extends TaskEvent {
  TaskDataLoaded();
}

class TaskNew extends TaskEvent {
  final TaskModel task;

  TaskNew(this.task);
}

class TaskUpdate extends TaskEvent {
  final TaskModel task;

  TaskUpdate(this.task);
}

class TaskDelete extends TaskEvent {
  final int taskId;

  TaskDelete(this.taskId);
}
