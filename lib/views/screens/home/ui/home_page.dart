import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_todo_manabie/core/utils/toast_utils.dart';
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
    BlocProvider.of<TaskBloc>(context).add(TaskDataLoadEvent());
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listenWhen: (_, current) => [
        TaskAddNewSuccessState,
        TaskUpdateSuccessState,
        TaskDeleteSuccessState,
        TaskFailureState
      ].contains(current.runtimeType),
      listener: (context, state) {
        switch(state.runtimeType){
          case TaskAddNewSuccessState: ToastUtils.showToast(context: context, msg: 'notifyAddNewTaskSuccess'.tr);break;
          case TaskUpdateSuccessState: ToastUtils.showToast(context: context, msg: 'notifyUpdateTaskSuccess'.tr);break;
          case TaskDeleteSuccessState: ToastUtils.showToast(context: context, msg: 'notifyDeleteTaskSuccess'.tr);break;
          case TaskFailureState: ToastUtils.showErrorToast(context: context, msg: 'notifyErrorTask'.tr);break;
        }
      },
      child: AutoTabsScaffold(
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
      ),
    );
  }
}
