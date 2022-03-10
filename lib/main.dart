import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_todo_manabie/core/utils/bloc_observer.dart';
import 'package:test_todo_manabie/core/utils/logger_utils.dart';
import 'package:test_todo_manabie/data/providers/database.dart';
import 'package:test_todo_manabie/data/providers/impl/task_provider_impl.dart';
import 'package:test_todo_manabie/data/providers/task_provider.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await TodoDB.open('todo.db');

  //Dependence Injection some service
  Get.put<AppRoute>(AppRoute());
  Get.lazyPut<TaskProvider>(()=>TaskProviderImpl());

  BlocOverrides.runZoned(
        () {
      runZonedGuarded(
            () async {
          runApp(const TodoApp());
        },
        onError,
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

Future<void> onError(Object error, StackTrace stack) async {
  logger.e('Application', error, stack);
  // Sentry.captureException(
  //   error,
  //   stackTrace: stack,
  // );
}



