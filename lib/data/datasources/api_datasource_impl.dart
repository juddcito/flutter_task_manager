

import 'package:dio/dio.dart';
import 'package:flutter_task_manager/data/mappers/task_mapper.dart';
import 'package:flutter_task_manager/data/models/task_model.dart';
import 'package:flutter_task_manager/domain/datasources/api_datasource.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';

class ApiDatasource extends TasksDatasource {
  
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://ecsdevapi.nextline.mx/vdev/tasks-challenge',
      headers: {
        'Authorization': 'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd'
      },
      queryParameters: {
        'token': 'taskUser2'
      }
      
    ),
  );

  // Método para convertir el JSON del response en entidades Task  
  List<Task> jsonToTasks(List<dynamic> json) {

    final List<TaskModel> taskModels = json
      .map((taskJson) => TaskModel.fromJson(taskJson))
      .toList();

    final List<Task> tasks = taskModels
      .map((taskModel) => TaskMapper.toEntity(taskModel))
      .toList();

    // Ordenar las tareas por fecha
    tasks.sort((a, b) {
      if (a.date == null && b.date == null) {
        return 0; // Ambas tareas no tienen fecha, se consideran iguales
      } else if (a.date == null) {
        return -1; // a va después de b
      } else if (b.date == null) {
        return 1; // a va antes de b
      } else {
        // Ambas tareas tienen fecha, comparamos las fechas
        return DateTime.parse(a.date!).compareTo(DateTime.parse(b.date!));
      }
    });
    return tasks;    
    
  }
  
  // Método GET para obtener el listado de tasks
  @override
  Future<List<Task>> getTasks() async {
    try {
      final response = await dio.get('/tasks');
      final tasks = jsonToTasks(response.data);
      return tasks;
    } catch (e) {
      throw Exception('Failed getting tasks: $e');
    }
  }

  // Método GET para obtener una task por su ID
  @override
  Future<Task> getTaskById(int id) async {
    try {
      final response = await dio.get(
        '/tasks/$id',
      );
      final tasks = jsonToTasks(response.data);
      return tasks.first;
    } catch (e) {
      throw Exception('Failed getting tasks: $e');
    }
  }
  
  // Método POST para crear una nueva tarea
  @override
  Future<void> addTask(Task task) async {

    try {

      Map<String, dynamic> queryParams = {};

      queryParams['title'] = task.title;
      queryParams['is_completed'] = task.isCompleted;
      if (task.date != null) queryParams['due_date'] = task.date; // Convertir DateTime a string
      if (task.comments != null && task.comments!.isNotEmpty) queryParams['comments'] = task.comments;
      if (task.description != null && task.description!.isNotEmpty) queryParams['description'] = task.description;
      if (task.tags != null && task.tags!.isNotEmpty) queryParams['tags'] = task.tags;

      await dio.post(
        '/tasks',
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        ),
        queryParameters: queryParams
      );     
    } catch (e) {
      throw Exception('Failed posting task: $e');
    }
  }
  
  // Método DELETE para borrar una tarea
  @override
  Future<void> deleteTask(int id) async {
    try {
      await dio.delete(
        '/tasks/$id',
      );    
    } catch (e) {
      throw Exception('Failed deleting task: $e');
    }
  }
  
  // Método PUT para editar una tarea
  @override
  Future<void> updateTask(Task task) async {
    try {

      Map<String, dynamic> queryParams = {};

      queryParams['title'] = task.title;
      queryParams['is_completed'] = task.isCompleted;
      if (task.date != null) queryParams['due_date'] = task.date; // Convertir DateTime a string
      if (task.comments != null && task.comments!.isNotEmpty) queryParams['comments'] = task.comments;
      if (task.description != null && task.description!.isNotEmpty) queryParams['description'] = task.description;
      if (task.tags != null && task.tags!.isNotEmpty) queryParams['tags'] = task.tags;

      final response = await dio.put(
        '/tasks/${task.id}',
        queryParameters: queryParams
      );

      print(response.data);

    } catch (e) {
      throw Exception('Failed updating task: $e');
    }
  }


}