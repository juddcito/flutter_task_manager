

import 'package:flutter_task_manager/domain/entities/task.dart';
// Clase abstracta para declarar los métodos CRUD que implementará el Datasource
abstract class TasksDatasource {

  Future<List<Task>> getTasks();
  Future<Task> getTaskById(int id);
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int id);

}