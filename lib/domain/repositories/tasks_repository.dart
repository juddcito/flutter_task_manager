

import 'package:flutter_task_manager/domain/entities/task.dart';

abstract class TasksRepository {

  Future<List<Task>> getTasks();
  Future<Task> getTaskById(int id);
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int id);

}