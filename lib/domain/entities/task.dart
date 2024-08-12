

class Task {

  int? id;
  String title;
  int isCompleted;
  String? date;
  String? comments;
  String? description;
  List<String>? tags;

  Task({
    this.id,
    required this.title,
    required this.isCompleted,
    this.date,
    this.comments,
    this.description,
    this.tags
  });  

}
