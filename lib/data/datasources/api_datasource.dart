

import 'package:dio/dio.dart';
import 'package:flutter_task_manager/data/mappers/task_mapper.dart';
import 'package:flutter_task_manager/data/models/task_model.dart';
import 'package:flutter_task_manager/domain/datasources/tasks_datasource.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';

class ApiDatasource extends TasksDatasource {
  
  final dio = Dio(
    BaseOptions(
      baseUrl: '> https://ecsdevapi.nextline.mx/vdev/tasks-challenge',
      headers: {
        'Authorization': 'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd'
      },
      queryParameters: {
        'token': 'tasksUser1'
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
  Future<List<Task>> getTasksById(int id) async {
    try {
      final response = await dio.get(
        '/tasks/task_id',
        queryParameters: {
          'task_id': id
        }
      );
      final task = jsonToTasks(response.data);
      return task;
    } catch (e) {
      throw Exception('Failed getting tasks: $e');
    }
  }


}