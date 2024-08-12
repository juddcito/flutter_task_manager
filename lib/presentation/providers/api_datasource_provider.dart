

import 'package:flutter_task_manager/data/datasources/api_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'api_datasource_provider.g.dart';

@riverpod
ApiDatasource apiDatasource(ApiDatasourceRef ref) {
  return ApiDatasource();
}