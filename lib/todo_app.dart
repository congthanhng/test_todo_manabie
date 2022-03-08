import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:test_todo_manabie/core/languages/app_translation.dart';
import 'package:test_todo_manabie/core/theme/app_theme.dart';
import 'package:test_todo_manabie/core/values/app_constant.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';
import 'package:test_todo_manabie/views/screens/home/bloc/task_bloc.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _appRouter = Get.find<AppRoute>();
    return BlocProvider<TaskBloc>(
      create: (context) => TaskBloc(),
      child: OverlaySupport.global(
        child: GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConstant.appName,
          translations: AppTranslation(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          theme: AppTheme.getAppTheme(false),
          darkTheme: AppTheme.getAppTheme(true),
          routerDelegate: AutoRouterDelegate(_appRouter),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}