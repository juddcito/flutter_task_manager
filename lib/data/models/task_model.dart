

class TaskModel {

  final int? id;
  final String title;
  final int isCompleted;
  final String? date;
  final String? comments;
  final String? description;
  final String? tags;

  TaskModel({
    this.id,
    required this.title,
    required this.isCompleted,
    this.date,
    this.comments,
    this.description,
    this.tags,
  });

  // fromJson para crear un TaskModel a partir de un JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['is_completed'],
      date: json['due_date'] ?? "",
      comments: json['comments'] ?? "",
      description: json['description'] ?? "",
      tags: json['tags'] ?? '',
    );
  }

  // Método para convertir un TaskModel a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'is_completed': isCompleted,
      'date': date,
      'comments': comments,
      'description': description,
      'tags': tags,
    };
  }
}
