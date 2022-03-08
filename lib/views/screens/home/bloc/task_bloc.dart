import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
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
  }

  Future<void> _onTaskDataLoaded(
      TaskDataLoaded event,
      Emitter<TaskState> emit,
  ) async {

    List<TaskModel> tasks = await taskProvider.getTasks();


    if(tasks.isEmpty){

    }else{

      final list = state.data.allTask;
      list.addAll(tasks);

      emit(TaskState(
          state.data.copyWith(
              allTask: list
          )
      ));
    }
  }

  Future<void> _onTaskNew(
      TaskNew event,
      Emitter<TaskState> emit,
  ) async {
    TaskModel taskInserted =  await taskProvider.insert(event.task);

    var tasks = state.data.copyWith();

    tasks.allTask.add(taskInserted);

    emit(TaskState(
        state.data.copyWith(
          allTask: tasks.allTask,
        )
    ));
  }

  Future<void> _onTaskUpdate(
      TaskUpdate event,
      Emitter<TaskState> emit,
  ) async {
    emit(TaskState(
        state.data.copyWith(

        )
    ));
  }

  Future<void> _onTaskDelete(
      TaskDelete event,
      Emitter<TaskState> emit,
  ) async {
    emit(TaskState(
        state.data.copyWith(

        )
    ));
  }
}
