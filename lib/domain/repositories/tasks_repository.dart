

import 'package:flutter_task_manager/domain/entities/task.dart';

abstract class TasksRepository {

  Future<List<Task>> getTasks();
  Future<List<Task>> getTasksById(int id);

}