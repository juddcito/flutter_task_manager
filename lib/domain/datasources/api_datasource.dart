

import 'package:flutter_task_manager/domain/entities/task.dart';

abstract class TasksDatasource {

  Future<List<Task>> getTasks();
  Future<List<Task>> getTasksById(int id);

}