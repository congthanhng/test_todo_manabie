import 'package:overlay_support/overlay_support.dart';
import 'package:test_todo_manabie/core/languages/app_translation.dart';
import 'package:test_todo_manabie/core/theme/app_theme.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _appRouter = Get.find<AppRoute>();
    return OverlaySupport.global(
      child: GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'ToDo',
        translations: AppTranslation(),
        theme: AppTheme.getAppTheme(false),
        darkTheme: AppTheme.getAppTheme(true),
        routerDelegate: AutoRouterDelegate(_appRouter),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}