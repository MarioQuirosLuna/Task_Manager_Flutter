class Task {
  late final String id;
  final String title;
  final String description;
  final DateTime date;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
  });

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, date: $date, isDone: $isDone)';
  }
}