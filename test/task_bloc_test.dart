import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' as mockito;
import 'package:test_todo_manabie/data/models/task_model.dart';
import 'package:test_todo_manabie/data/providers/task_provider.dart';
import 'package:test_todo_manabie/views/screens/home/bloc/task_bloc.dart';

import 'mock_data.dart';
import 'task_bloc_test.mocks.dart';

@GenerateMocks([TaskProvider])
void main() {
  late TaskBloc _taskBloc;
  late TaskProvider _taskProvider;
  setUp(() async {
    _taskProvider = MockTaskProvider();
    _taskBloc = TaskBloc(taskProvider: _taskProvider);
  });

  group('Task Bloc Error case',(){
    blocTest(
      'emits [TaskFailureState] when TaskNewEvent is called',
      build: () {
        mockito
            .when(_taskProvider.insert(mockTask))
            .thenAnswer((_) => Future.error(mockTask));
        return _taskBloc;
      },
      act: (bloc) => _taskBloc.add(TaskNewEvent(mockTask)),
      expect: () => [
        isA<TaskFailureState>(),
      ],
    );

    blocTest(
      'emits [TaskFailureState] when TaskUpdateEvent is called',
      build: () {
        mockito
            .when(_taskProvider.update(mockTask))
            .thenAnswer((_) => Future.error(mockTask));
        return _taskBloc;
      },
      act: (bloc) => _taskBloc.add(TaskUpdateEvent(mockTask)),
      expect: () => [
        isA<TaskFailureState>(),
      ],
    );

    blocTest(
      'emits [TaskFailureState] when TaskDeleteEvent is called',
      build: () {
        mockito
            .when(_taskProvider.delete(2))
            .thenAnswer((_) => Future.error(mockTask));
        return _taskBloc;
      },
      act: (bloc) => _taskBloc.add(TaskDeleteEvent(2)),
      expect: () => [
        isA<TaskFailureState>(),
      ],
    );
  });

  group('Task Bloc Manual case',(){
    blocTest(
      'emits [TaskLoadedState] when [TaskDataLoadEvent] is called',
      build: () {
        mockito
            .when(_taskProvider.getTasks())
            .thenAnswer((_) => Future.value(mockRecords));
        return _taskBloc;
      },
      act: (bloc) => _taskBloc.add(TaskDataLoadEvent()),
      expect: () => [
        isA<TaskLoadedState>().having((state) => state.data.allTask.isNotEmpty,
            'all task not empty: ', true),
      ],
    );

    blocTest(
      'emits [TaskAddNewSuccessState] when add new is success'
          'and emit [TaskLoadedState] after TaskLoadedState load again data from DB',
      build: () {
        mockito
            .when(_taskProvider.insert(mockTask))
            .thenAnswer((_) => Future.value(mockTask));
        mockito
            .when(_taskProvider.getTasks())
            .thenAnswer((_) => Future.value([...mockRecords, mockTask]));
        return _taskBloc;
      },
      act: (bloc) => _taskBloc.add(TaskNewEvent(mockTask)),
      expect: () => [
        isA<TaskAddNewSuccessState>(),
        isA<TaskLoadedState>()
            .having((state) => state.data.allTask.length, 'all task length:', 6),
      ],
    );

    blocTest(
      'emits [TaskDeleteSuccessState] when TaskDeleteEvent is success'
          'and emit [TaskLoadedState] after TaskLoadedState load again data from DB',
      build: () {
        mockito.when(_taskProvider.delete(2)).thenAnswer((_) {
          var idReturn = mockRecords[2].taskId;
          mockRecords.removeAt(2);
          return Future.value(idReturn);
        });
        mockito
            .when(_taskProvider.getTasks())
            .thenAnswer((_) => Future.value(mockRecords));
        return _taskBloc;
      },
      act: (bloc) => _taskBloc.add(TaskDeleteEvent(2)),
      expect: () => [
        isA<TaskDeleteSuccessState>(),
        isA<TaskLoadedState>()
            .having((state) => state.data.allTask.length, 'all task length:', 4),
      ],
    );

    blocTest(
      'emits [TaskUpdateSuccessState] when add new is success'
          'and emit [TaskLoadedState] after TaskLoadedState load again data from DB',
      build: () {
        mockito
            .when(_taskProvider.update(mockRecords.first))
            .thenAnswer((_) => Future.value(mockRecords.first.taskId));
        mockito
            .when(_taskProvider.getTasks())
            .thenAnswer((_) {
          mockRecords.first = TaskModel(taskId: mockRecords.first.taskId, title:mockRecords.first.title, isDone: !mockRecords.first.isDone );
          return Future.value(mockRecords);
        } );
        return _taskBloc;
      },
      act: (bloc) => _taskBloc.add(TaskUpdateEvent(mockRecords.first)),
      expect: () => [
        isA<TaskUpdateSuccessState>(),
        isA<TaskLoadedState>()
            .having((state) => state.data.allTask.first.isDone, 'Task first is done:', true),
      ],
    );
  });
}
