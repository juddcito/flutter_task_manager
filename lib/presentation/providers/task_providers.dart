


import 'package:flutter_task_manager/domain/entities/task.dart';
import 'package:flutter_task_manager/presentation/providers/api_datasource_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'task_providers.g.dart';

@riverpod
class Tasks extends _$Tasks {

  @override
   Future<List<Task>> build() async {
    final apiDatasource = ref.watch(apiDatasourceProvider);
    return await apiDatasource.getTasks();
  }

  Future<void> addTask(Task task) async {
    final apiDatasource = ref.watch(apiDatasourceProvider);
    await apiDatasource.addTask(task);
    ref.invalidateSelf();
    await future;
  }

  Future<void> deleteTask(int id) async {
    final apiDatasource = ref.watch(apiDatasourceProvider);
    await apiDatasource.deleteTask(id);
    ref.invalidateSelf();
    await future;
  }

  Future<void> updateTask(Task task) async {
    final apiDatasource = ref.watch(apiDatasourceProvider);
    await apiDatasource.updateTask(task);
    ref.invalidateSelf();
    await future;
  }

}

@riverpod
Future<Task> getTaskById(GetTaskByIdRef ref, int id) async {
  final apiDatasource = ref.watch(apiDatasourceProvider);
  final task = await apiDatasource.getTaskById(id);
  return task;
}