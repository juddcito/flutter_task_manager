

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/presentation/providers/task_providers.dart';
import 'package:flutter_task_manager/presentation/widgets/task_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final tasksAsyncValue = ref.watch(tasksProvider);

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
        child: tasksAsyncValue.when(
          data: (tasks) {

            if (tasks.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Add a new task!'),
                    const SizedBox(height: 15),
                    Pulse(
                      infinite: true,
                      duration: const Duration(seconds: 3),
                      child: const Icon(
                        Icons.task,
                        size: 32
                      )                      
                    )
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return TaskTile(task: task);
              },
            );
          },
          error:(error, stackTrace) => Center(child: Text('Error: $error')),
          loading:() => const Center(child: CircularProgressIndicator()),
        )
      ),
    );
  }
}