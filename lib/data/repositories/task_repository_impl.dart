

import 'package:flutter_task_manager/domain/datasources/api_datasource.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';
import 'package:flutter_task_manager/domain/repositories/tasks_repository.dart';

class TaskRepositoryImpl extends TasksRepository {

  final TasksDatasource datasource;

  TaskRepositoryImpl(this.datasource);

  @override
  Future<List<Task>> getTasks() {
    return datasource.getTasks();
  }

  @override
  Future<List<Task>> getTasksById(int id) {
    return datasource.getTasksById(id);
  }


}