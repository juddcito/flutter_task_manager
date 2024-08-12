

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
  Future<Task> getTaskById(int id) {
    return datasource.getTaskById(id);
  }
  
  @override
  Future<void> addTask(Task task) {
    return datasource.addTask(task);
  }
  
  @override
  Future<void> deleteTask(int id) {
    return datasource.deleteTask(id);
  }
  
  @override
  Future<void> updateTask(Task task) {
    return datasource.updateTask(task);
  }


}