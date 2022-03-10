part of 'task_bloc.dart';

@immutable
class TaskState {
  final HomeData data;

  const TaskState(this.data);
}

class TaskLoadedState extends TaskState {
  const TaskLoadedState(HomeData data) : super(data);
}

class TaskAddNewSuccessState extends TaskState {
  const TaskAddNewSuccessState(HomeData data) : super(data);
}

class TaskUpdateSuccessState extends TaskState {
  const TaskUpdateSuccessState(HomeData data) : super(data);
}

class TaskDeleteSuccessState extends TaskState {
  const TaskDeleteSuccessState(HomeData data) : super(data);
}

class TaskFailureState extends TaskState {
  const TaskFailureState(HomeData data) : super(data);
}
