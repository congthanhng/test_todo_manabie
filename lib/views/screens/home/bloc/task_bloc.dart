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

  TaskBloc({TaskProvider? taskProvider}) : super(TaskState(HomeData())) {
    _taskProvider = taskProvider ?? Get.find<TaskProvider>();

    on<TaskDataLoadEvent>(_onTaskDataLoaded);
    on<TaskNewEvent>(_onTaskNew);
    on<TaskUpdateEvent>(_onTaskUpdate);
    on<TaskDeleteEvent>(_onTaskDelete);
    on<TaskFailureEvent>(_onTaskFailure);
  }

  late TaskProvider _taskProvider;



  Future<void> _onTaskDataLoaded(
    TaskDataLoadEvent event,
    Emitter<TaskState> emit,
  ) async {
    List<TaskModel> tasks = await _taskProvider.getTasks();
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
    emit(TaskLoadedState(state.data.copyWith(
        allTask: list,
        completeTasks: completedList,
        inCompleteTasks: inCompletedList)));
  }

  Future<void> _onTaskNew(
    TaskNewEvent event,
    Emitter<TaskState> emit,
  ) async {
    await _taskProvider.insert(event.task).then(
            (value) {
              add(TaskDataLoadEvent());
              emit(TaskAddNewSuccessState(HomeData()));
            },
        onError: (err) => add(TaskFailureEvent()));
  }

  Future<void> _onTaskUpdate(
    TaskUpdateEvent event,
    Emitter<TaskState> emit,
  ) async {
    await _taskProvider.update(event.task).then(
            (value) {
              add(TaskDataLoadEvent());
              emit(TaskUpdateSuccessState(HomeData()));
            },
        onError: (err) => add(TaskFailureEvent()));
  }

  Future<void> _onTaskDelete(
    TaskDeleteEvent event,
    Emitter<TaskState> emit,
  ) async {
    await _taskProvider.delete(event.taskId).then(
        (value) {
          add(TaskDataLoadEvent());
          emit(TaskDeleteSuccessState(HomeData()));
        }
        ,
        onError: (err) => add(TaskFailureEvent()));
  }

  Future<void> _onTaskFailure(
    TaskFailureEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskFailureState(HomeData()));
  }
}
