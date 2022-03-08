import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';
import 'package:test_todo_manabie/views/screens/home/bloc/task_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(TaskDataLoaded());
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeAllRoute(),
        HomeCompleteRoute(),
        HomeIncompleteRoute()
      ],
      lazyLoad: false,
      animationDuration: Duration.zero,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
                label: 'all'.tr, icon: const Icon(Icons.list_alt)),
            BottomNavigationBarItem(
                label: 'complete'.tr, icon: const Icon(Icons.done_outline)),
            BottomNavigationBarItem(
                label: 'inComplete'.tr, icon: const Icon(Icons.close)),
          ],
        );
      },
    );
  }
}
