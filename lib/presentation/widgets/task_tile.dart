

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';
import 'package:flutter_task_manager/presentation/providers/task_providers.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TaskTile extends ConsumerWidget {

  final Task task;

  const TaskTile({
    super.key,
    required this.task
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final date = task.date != null ? DateTime.parse(task.date!) : null;

    return Card(
      child: ListTile(
        onTap: () => context.push('/task-details/${task.id}'),
        leading: Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: (task.isCompleted == 1),
            onChanged:(value) {
              if (value != null) {
                task.isCompleted = (value == true) ? 1 : 0;
                ref.read(tasksProvider.notifier).updateTask(task);
              }
            },
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted == 1 ? TextDecoration.lineThrough : TextDecoration.none
          ),
        ),
        subtitle: Text(date != null ? DateFormat('MMMM d, y').format(date) : 'No due date'),
      ),
    );
  }
}