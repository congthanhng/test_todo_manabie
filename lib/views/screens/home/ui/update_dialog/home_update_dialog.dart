import 'package:test_todo_manabie/shelf/all_import.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class HomeUpdateDialog extends StatelessWidget {
  const HomeUpdateDialog({Key? key, @pathParam required this.taskId})
      : super(key: key);
  final int taskId;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            color: Colors.red,
            child: taskId.toString().text.make(),
          ),
        ],
      ),
    );
  }
}
