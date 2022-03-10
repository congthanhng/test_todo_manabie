import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_todo_manabie/core/styles/app_gap_style.dart';
import 'package:test_todo_manabie/data/models/task_model.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';
import 'package:test_todo_manabie/views/screens/home/bloc/task_bloc.dart';
import 'package:test_todo_manabie/views/screens/home/model/home_data.dart';
import 'package:test_todo_manabie/views/screens/home/ui/widgets/empty.dart';
import 'package:test_todo_manabie/views/screens/home/ui/widgets/task_item.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeAllPage extends StatefulWidget {
  const HomeAllPage({Key? key}) : super(key: key);

  @override
  State<HomeAllPage> createState() => _HomeAllPageState();
}

class _HomeAllPageState extends State<HomeAllPage> {
  final _controller = TextEditingController();
  final FocusNode fieldNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('all'.tr),
        ),
        body: Column(
          children: [
            BlocBuilder<TaskBloc, TaskState>(
                buildWhen: (_, current) => [
                      TaskLoadedState,
                      // TaskAddNewSuccess
                      // JobListMapUpdateSuccess,
                    ].contains(current.runtimeType),
                builder: (context, state) {
                  // _controller.text = '';
                  return _buildPages(state.data);
                }).expand(),
            TextFormField(
                controller: _controller,
                focusNode: fieldNode,
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                    // Border
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    filled: true,
                    // hintText: 'Add task',
                    labelText: 'addTask'.tr
                    // Icons
                    ),
                onEditingComplete: () {
                  fieldNode.unfocus();
                  if (_controller.text.isNotBlank) {
                    BlocProvider.of<TaskBloc>(context).add(TaskNewEvent(
                        TaskModel(title: _controller.text, isDone: false)));
                    _controller.clear();
                  }
                })
          ],
        ),
        resizeToAvoidBottomInset: true
        );
  }

  Widget _buildPages(HomeData data) {
    return data.allTask.isEmpty
        ? EmptyWidget(content: 'emptyTask'.tr,)
        : _buildTaskList(data.inCompleteTasks, data.completeTasks);
  }

  Widget _buildTaskList(
      List<TaskModel> inCompleteTask, List<TaskModel> completedTasks) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gaps.hGap6,
          ...inCompleteTask.map((e) => TaskItem(item: e,)),
          completedTasks.isNotEmpty
              ? ExpansionTile(
                  title:
                      '${'completed'.tr}: ${completedTasks.length}'.text.make(),
                  initiallyExpanded: true,
                  // subtitle: Text('Trailing expansion arrow icon'),
                  children: <Widget>[
                    ...completedTasks.map((e) => TaskItem(item: e,)),
                  ],
                )
              : Gaps.empty
        ],
      ),
    );
  }

}
