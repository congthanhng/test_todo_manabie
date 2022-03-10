import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_todo_manabie/core/styles/app_gap_style.dart';
import 'package:test_todo_manabie/data/models/task_model.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';
import 'package:test_todo_manabie/views/screens/home/bloc/task_bloc.dart';
import 'package:test_todo_manabie/views/screens/home/model/home_data.dart';
import 'package:test_todo_manabie/views/screens/home/ui/widgets/empty.dart';
import 'package:test_todo_manabie/views/screens/home/ui/widgets/task_item.dart';


class HomeIncompletePage extends StatelessWidget {
  const HomeIncompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('inComplete'.tr),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
          buildWhen: (_, current) => [
            TaskLoadedState,
            // JobListMapUpdateSuccess,
          ].contains(current.runtimeType),
          builder: (context, state) {
            // _controller.text = '';
            return _buildPages(state.data);
          }),
    );
  }
  Widget _buildPages(HomeData data) {
    return data.inCompleteTasks.isEmpty
        ? EmptyWidget(content: 'emptyIncompleteTask'.tr,)
        : _buildTaskList(data.inCompleteTasks);
  }
  Widget _buildTaskList(List<TaskModel> inCompleteTasks) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gaps.hGap6,
          ...inCompleteTasks.map((e) => TaskItem(item: e,)),
        ],
      ),
    );
  }
}
