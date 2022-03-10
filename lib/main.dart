import 'package:test_todo_manabie/data/providers/database.dart';
import 'package:test_todo_manabie/data/providers/impl/task_provider_impl.dart';
import 'package:test_todo_manabie/data/providers/task_provider.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await TodoDB.open('todo.db');

  Get.put<AppRoute>(AppRoute());
  Get.lazyPut<TaskProvider>(()=>TaskProviderImpl());

  runApp(const TodoApp());
}


