

import 'package:flutter/material.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';
import 'package:go_router/go_router.dart';

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
        onTap: () => context.push('/task-details/${task.id}'),
        leading: Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: (task.isCompleted == 1),
            onChanged:(value) {
              
            },
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted == 1 ? TextDecoration.lineThrough : TextDecoration.none
          ),
        ),
        subtitle: Text(task.date ?? 'No date'),
      ),
    );
  }
}