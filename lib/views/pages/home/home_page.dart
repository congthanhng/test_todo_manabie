import 'package:test_todo_manabie/shelf/all_import.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeAllRoute(), HomeCompleteRoute(), HomeIncompleteRoute()],
      lazyLoad: false,
      animationDuration: Duration.zero,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'All', icon: Icon(Icons.list_alt)),
            BottomNavigationBarItem(label: 'Complete', icon: Icon(Icons.done_outline)),
            BottomNavigationBarItem(label: 'In Complete', icon: Icon(Icons.close)),
          ],
        );
      },
    );
  }
}
