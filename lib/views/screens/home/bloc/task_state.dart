part of 'task_bloc.dart';

@immutable
class TaskState {
  final HomeData data;

  const TaskState(this.data);
}

class TaskLoaded extends TaskState {
  const TaskLoaded(HomeData data) : super(data);
}
