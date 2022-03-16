import 'package:test_todo_manabie/shelf/all_import.dart';
import 'package:test_todo_manabie/views/screens/home/ui/update_dialog/home_update_dialog.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page|Dialog,Route',
    routes: <AutoRoute>[
      AutoRoute(
          path: '/home',
          page: HomePage,
          initial: true,
          children: <AutoRoute>[
            AutoRoute(path: 'all', page: HomeAllPage, initial: true),
            AutoRoute(
              path: 'complete',
              page: HomeCompletePage,
            ),
            AutoRoute(
              path: 'incomplete',
              page: HomeIncompletePage,
            ),
          ]),
      AutoRoute(
          path: 'update/:taskId',
          page: HomeUpdateDialog,
          fullscreenDialog: false)
    ])
class $AppRoute {}
