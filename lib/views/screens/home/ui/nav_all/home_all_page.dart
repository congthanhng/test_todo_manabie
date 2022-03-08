import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_todo_manabie/data/models/task_model.dart';
import 'package:test_todo_manabie/shelf/all_import.dart';
import 'package:test_todo_manabie/views/screens/home/bloc/task_bloc.dart';
import 'package:test_todo_manabie/views/screens/home/model/home_data.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeAllPage extends StatelessWidget {
  const HomeAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('all'.tr),
      ),
      body: Container(
        child: BlocBuilder<TaskBloc,TaskState>(
            buildWhen: (_, current) => ![
              TaskLoaded,
              // JobListMapUpdateSuccess,
            ].contains(current.runtimeType),
            builder: (context, state) {
              return _buildPages(state.data);
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          BlocProvider.of<TaskBloc>(context).add(TaskDataLoaded());
        },
      ),
    );
  }

  Widget _buildPages(HomeData data){
    return data.allTask.isEmpty?_buildEmpty():_buildTaskList(data.allTask);
  }

  Widget _buildTaskList(List<TaskModel> tasks){
    return ListView.separated(
      separatorBuilder: (context,index)=>SizedBox(height: 10,),
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return tasks[index].title.text.make();
      },
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Text(
        'Opps! \n'
            'You have no task now. \nPlease add your tasks by using plus button below.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
