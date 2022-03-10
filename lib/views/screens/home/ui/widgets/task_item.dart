import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_todo_manabie/data/models/task_model.dart';
import 'package:test_todo_manabie/views/screens/home/bloc/task_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key,required this.item}) : super(key: key);
  final TaskModel item;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[200],
      child: Container(
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              // fillColor: MaterialStateProperty.resolveWith(getColor),
              value: item.isDone,
              onChanged: (bool? value) {
                BlocProvider.of<TaskBloc>(context).add(TaskUpdateEvent(TaskModel(
                    taskId: item.taskId,
                    title: item.title,
                    isDone: !item.isDone)));
              },
            ),
            item.isDone
                ? item.title.text.lineThrough.make().expand()
                : item.title.text.make().expand(),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                BlocProvider.of<TaskBloc>(context)
                    .add(TaskDeleteEvent(item.taskId!));
              },
            )
          ],
        ).p4(),
      ).px(4),
    );
  }
}
