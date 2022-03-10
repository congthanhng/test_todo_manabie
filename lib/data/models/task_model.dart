class TaskModel {
  static const String task_id = 'taskId';
  static const String task_title = 'title';
  static const String task_isDone = 'isDone';

  int? taskId;
  String title;
  bool isDone;

  TaskModel({
    this.taskId,
    required this.title,
    required this.isDone,
  });

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        // 'taskId': taskId,
        'title': title,
        'isDone': isDone == true ? 1 : 0
      };

  TaskModel.fromMap(Map<String, dynamic> map)
      : taskId = map['taskId'],
        title = map['title'],
        isDone = map['isDone'] == 1;
}