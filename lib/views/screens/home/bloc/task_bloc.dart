import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:test_todo_manabie/core/extensions/iterable_extensions.dart';
import 'package:test_todo_manabie/data/models/task_model.dart';
import 'package:test_todo_manabie/data/providers/task_provider.dart';
import 'package:test_todo_manabie/views/screens/home/model/home_data.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final taskProvider = Get.find<TaskProvider>();

  // final homeData = HomeData();

  TaskBloc() : super(TaskState(HomeData())) {
    on<TaskDataLoaded>(_onTaskDataLoaded);
    on<TaskNew>(_onTaskNew);
    on<TaskUpdate>(_onTaskUpdate);
    on<TaskDelete>(_onTaskDelete);
    on<TaskFailure>(_onTaskFailure);
  }

  Future<void> _onTaskDataLoaded(
    TaskDataLoaded event,
    Emitter<TaskState> emit,
  ) async {
    List<TaskModel> tasks = await taskProvider.getTasks();
    var completedTasks = tasks.where((e) => e.isDone).toList();
    var inCompleteTasks = tasks.where((e) => e.isDone == false).toList();
    // print('tasks: ${tasks.length} - completedTasks: ${completedTasks.length} - inCompleteTasks: ${inCompleteTasks.length}');

    final list = state.data.allTask;
    final completedList = state.data.completeTasks;
    final inCompletedList = state.data.inCompleteTasks;

    list.addAllClearFirst(tasks);
    completedList.addAllClearFirst(completedTasks);
    inCompletedList.addAllClearFirst(inCompleteTasks);

    // print('list: ${list.length} - completedList: ${completedList.length} - inCompleteTasks: ${inCompleteTasks.length}');
    emit(TaskLoaded(state.data.copyWith(
        allTask: list,
        completeTasks: completedList,
        inCompleteTasks: inCompletedList)));
  }

  Future<void> _onTaskNew(
    TaskNew event,
    Emitter<TaskState> emit,
  ) async {
    await taskProvider.insert(event.task).then(
            (value) {
              add(TaskDataLoaded());
              emit(TaskAddNewSuccess(HomeData()));
            },
        onError: (err) => add(TaskFailure()));
  }

  Future<void> _onTaskUpdate(
    TaskUpdate event,
    Emitter<TaskState> emit,
  ) async {
    await taskProvider.update(event.task).then(
            (value) {
              add(TaskDataLoaded());
              emit(TaskUpdateSuccess(HomeData()));
            },
        onError: (err) => add(TaskFailure()));
  }

  Future<void> _onTaskDelete(
    TaskDelete event,
    Emitter<TaskState> emit,
  ) async {
    await taskProvider.delete(event.taskId).then(
        (value) {
          add(TaskDataLoaded());
          emit(TaskDeleteSuccess(HomeData()));
        }
        ,
        onError: (err) => add(TaskFailure()));
  }

  Future<void> _onTaskFailure(
    TaskFailure event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskFailured(HomeData()));
  }
}
