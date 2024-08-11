import 'package:flutter_task_manager/presentation/screens/home_screen.dart';
import 'package:flutter_task_manager/presentation/screens/task_create_screen.dart';
import 'package:flutter_task_manager/presentation/screens/task_details_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/task-details',
      builder: (context, state) => const TaskDetailsScreen(),
    ),

    GoRoute(
      path: '/task-create',
      builder: (context, state) => const TaskCreateScreen(),
    ),

  ]
);