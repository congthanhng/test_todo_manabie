part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class TaskDataLoadEvent extends TaskEvent {
  TaskDataLoadEvent();
}

class TaskNewEvent extends TaskEvent {
  final TaskModel task;

  TaskNewEvent(this.task);
}

class TaskUpdateEvent extends TaskEvent {
  final TaskModel task;

  TaskUpdateEvent(this.task);
}

class TaskDeleteEvent extends TaskEvent {
  final int taskId;

  TaskDeleteEvent(this.taskId);
}

class TaskFailureEvent extends TaskEvent {
  final String? msg;

  TaskFailureEvent({this.msg});
}