

class TaskModel {

  final int id;
  final String title;
  final String? date;
  final String? comments;
  final String? description;
  final List<String>? tag;

  TaskModel({
    required this.id,
    required this.title,
    this.date,
    this.comments,
    this.description,
    this.tag,
  });

  // fromJson para crear un TaskModel a partir de un JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      comments: json['comments'],
      description: json['description'],
      tag: json['tag'] != null ? List<String>.from(json['tags']) : null,
    );
  }

  // Método para convertir un TaskModel a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'comments': comments,
      'description': description,
      'tag': tag,
    };
  }
}
