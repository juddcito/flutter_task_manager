import 'package:flutter_task_manager/data/models/task_model.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';

class TaskMapper {
  
  // Método estático para mapear de TaskModel a Task
  static Task toEntity(TaskModel model) {
    return Task(
      id: model.id,
      title: model.title,
      date: model.date ?? '',
      comments: model.comments ?? '',
      description: model.description ?? '',
      tag: model.tags ?? [],
    );
  }

  // Método estático para mapear de Task a TaskModel (si es necesario)
  static TaskModel toModel(Task entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      date: entity.date ?? '',
      comments: entity.comments ?? '',
      description: entity.description ?? '',
      tags: entity.tag ?? [],
    );
  }
}
