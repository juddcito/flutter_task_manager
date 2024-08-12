

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TaskDetailsScreen extends StatelessWidget {

  final int taskId;

  const TaskDetailsScreen({
    super.key,
    required this.taskId
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red[200]),
            )
          ),
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Save')
          )
        ],
      ),
    );
  }
}