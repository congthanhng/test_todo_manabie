// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_todo_manabie/data/providers/task_provider.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';
import 'package:test_todo_manabie/views/screens/home/bloc/task_bloc.dart';

class MockTaskBloc extends MockBloc<TaskStateFake, TaskEventFake>
    implements TaskBloc {}

class TaskStateFake extends Fake implements TaskState {}

class TaskEventFake extends Fake implements TaskEvent {}

void main() {
  late TaskProvider taskProvider;
  setUp(() async {
    // await TodoDB.open('todo.db');

    Get.put<AppRoute>(AppRoute());
    // Get.lazyPut<TaskProvider>(()=>TaskProviderImpl());
  });
  // taskProvider = Get.put<TaskProvider>(TaskProviderImpl());
  testWidgets('current route is "all" page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TodoApp());
    await tester.pump();
    // await tester.pump();
    // when(taskProvider.getTasks()).thenAnswer((_)=>Future.value(mockRecords));
    //
    // // Verify that our counter starts at 0.
    // expect(find.text('all'.tr), findsNWidgets(2));
    // expect(find.text('notifyErrorTask'.tr), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
