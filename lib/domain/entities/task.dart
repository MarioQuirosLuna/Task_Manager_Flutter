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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'isDone': isDone,
    };
  }
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      isDone: json['isDone'] as bool,
    );
  }

}