import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_todo_manabie/core/styles/app_gap_style.dart';
import 'package:test_todo_manabie/data/models/task_model.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';
import 'package:test_todo_manabie/views/screens/home/bloc/task_bloc.dart';
import 'package:test_todo_manabie/views/screens/home/model/home_data.dart';
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
        body: Container(
          child: Column(
            children: [
              BlocBuilder<TaskBloc, TaskState>(
                  buildWhen: (_, current) => ![
                        TaskLoaded,
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
                      BlocProvider.of<TaskBloc>(context).add(TaskNew(
                          TaskModel(title: _controller.text, isDone: false)));
                    }
                  })
            ],
          ),
        ),
        resizeToAvoidBottomInset: true
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () {
        //     // BlocProvider.of<TaskBloc>(context).add(TaskDataLoaded());
        //   },
        // ),
        );
  }

  Widget _buildPages(HomeData data) {
    return data.allTask.isEmpty
        ? _buildEmpty()
        : _buildTaskList(data.inCompleteTasks, data.completeTasks);
  }

  Widget _buildTaskList(List<TaskModel> inCompleteTask, List<TaskModel> completedTasks) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gaps.hGap6,
          ...inCompleteTask.map((e)=>_buildItemTask(e)),
          completedTasks.isNotEmpty
              ? ExpansionTile(
                  title: '${'completed'.tr}: ${completedTasks.length}'.text.make(),
                  // subtitle: Text('Trailing expansion arrow icon'),
                  children: <Widget>[
                    ...completedTasks.map((e)=>_buildItemTask(e)),
                  ],
                )
              : Gaps.empty
        ],
      ),
    );
  }

  Widget _buildItemTask(TaskModel item){
    // return Card(
    //   color: Colors.amber[200],
    //   child: ListTile(
    //     leading: Checkbox(
    //       checkColor: Colors.white,
    //       // fillColor: MaterialStateProperty.resolveWith(getColor),
    //       value: item.isDone,
    //       onChanged: (bool? value) {
    //         BlocProvider.of<TaskBloc>(context).add(TaskUpdate(
    //             TaskModel(
    //                 taskId: item.taskId,
    //                 title: item.title,
    //                 isDone: !item.isDone)));
    //       },
    //     ),
    //       title: item.isDone?item.title.text.lineThrough.make():item.title.text.make(),
    //   ),
    // );
     return Card(
       color: Colors.amber[200],
       child: Container(
            // decoration: BoxDecoration(
            //   // border: Border.all(color: Colors.amber),
            //     color: Colors.amber[200],
            //     borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  // fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: item.isDone,
                  onChanged: (bool? value) {
                    BlocProvider.of<TaskBloc>(context).add(TaskUpdate(
                        TaskModel(
                            taskId: item.taskId,
                            title: item.title,
                            isDone: !item.isDone)));
                  },
                ),
                item.isDone?item.title.text.lineThrough.make().expand():item.title.text.make().expand(),
                IconButton(
                icon: Icon(Icons.close), onPressed: () {
                  BlocProvider.of<TaskBloc>(context).add(TaskDelete(item.taskId!));
                },
                )
              ],
            ).p4(),
          ).px(4),
     );
  }

  Widget _buildEmpty() => 'emptyTask'.tr.text.center.make().centered();
}
