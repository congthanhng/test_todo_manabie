// Mocks generated by Mockito 5.1.0 from annotations
// in test_todo_manabie/test/task_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:test_todo_manabie/data/models/task_model.dart' as _i2;
import 'package:test_todo_manabie/data/providers/task_provider.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTaskModel_0 extends _i1.Fake implements _i2.TaskModel {}

/// A class which mocks [TaskProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskProvider extends _i1.Mock implements _i3.TaskProvider {
  MockTaskProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.TaskModel> insert(_i2.TaskModel? task) =>
      (super.noSuchMethod(Invocation.method(#insert, [task]),
              returnValue: Future<_i2.TaskModel>.value(_FakeTaskModel_0()))
          as _i4.Future<_i2.TaskModel>);
  @override
  _i4.Future<List<_i2.TaskModel>> getTasks() =>
      (super.noSuchMethod(Invocation.method(#getTasks, []),
              returnValue: Future<List<_i2.TaskModel>>.value(<_i2.TaskModel>[]))
          as _i4.Future<List<_i2.TaskModel>>);
  @override
  _i4.Future<_i2.TaskModel?> getTaskById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTaskById, [id]),
              returnValue: Future<_i2.TaskModel?>.value())
          as _i4.Future<_i2.TaskModel?>);
  @override
  _i4.Future<int> delete(int? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<int>.value(0)) as _i4.Future<int>);
  @override
  _i4.Future<int> update(_i2.TaskModel? task) =>
      (super.noSuchMethod(Invocation.method(#update, [task]),
          returnValue: Future<int>.value(0)) as _i4.Future<int>);
}
