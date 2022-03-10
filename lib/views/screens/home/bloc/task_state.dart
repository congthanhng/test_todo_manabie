part of 'task_bloc.dart';

@immutable
class TaskState {
  final HomeData data;

  const TaskState(this.data);
}

class TaskLoaded extends TaskState {
  const TaskLoaded(HomeData data) : super(data);
}

class TaskAddNewSuccess extends TaskState {
  const TaskAddNewSuccess(HomeData data) : super(data);
}

class TaskUpdateSuccess extends TaskState {
  const TaskUpdateSuccess(HomeData data) : super(data);
}

class TaskDeleteSuccess extends TaskState {
  const TaskDeleteSuccess(HomeData data) : super(data);
}

class TaskFailured extends TaskState {
  const TaskFailured(HomeData data) : super(data);
}
