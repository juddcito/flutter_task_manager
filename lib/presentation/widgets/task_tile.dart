

import 'package:flutter/material.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';

class TaskTile extends StatelessWidget {

  final Task task;

  const TaskTile({
    super.key,
    required this.task
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: (task.isCompleted == 1),
          onChanged:(value) {
            
          },
        ),
        title: Text(task.title),
        subtitle: Text(task.date ?? 'No date'),
      ),
    );
  }
}