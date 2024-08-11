

import 'package:flutter/material.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';
import 'package:flutter_task_manager/presentation/widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            onPressed: () {},
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
              isCompleted: 1
            );
            return TaskTile(task: task);
          },
        ),
      ),
    );
  }
}