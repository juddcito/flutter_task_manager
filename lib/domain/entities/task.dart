

class Task {

  int id;
  String title;
  String? date;
  String? comments;
  String? description;
  List<String>? tag;

  Task({
    required this.id,
    required this.title,
    this.date,
    this.comments,
    this.description,
    this.tag
  });  

}
