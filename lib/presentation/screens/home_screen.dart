

import 'package:flutter/material.dart';
import 'package:flutter_task_manager/config/router/app_router.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';
import 'package:flutter_task_manager/presentation/widgets/task_tile.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: () {
              context.push('/task-create');
            },
            color: colors.primary,
            icon: const Icon(Icons.add)
          )
          
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder:(context, index) {
            final task = Task(
              id: 2222,
              title: 'Hacer las compras del día',
              isCompleted: 1,
              tags: ['tag1,', 'tag2']
            );
            return TaskTile(task: task);
          },
        ),
      ),
    );
  }
}