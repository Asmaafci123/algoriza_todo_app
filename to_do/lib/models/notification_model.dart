class TaskNotificationModel {
  final int id;
  final String? title;
  final String? body;
  final DateTime dateTime;

  TaskNotificationModel(
      {required this.id, this.title, this.body, required this.dateTime});
}
