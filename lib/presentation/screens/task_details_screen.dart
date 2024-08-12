

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/presentation/providers/task_providers.dart';
import 'package:flutter_task_manager/presentation/widgets/custom_datepicker.dart';
import 'package:flutter_task_manager/presentation/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';

class TaskDetailsScreen extends ConsumerStatefulWidget {

  final int taskId;

  const TaskDetailsScreen({
    super.key,
    required this.taskId
  });

  @override
  TaskDetailsScreenState createState() => TaskDetailsScreenState();
}

class TaskDetailsScreenState extends ConsumerState<TaskDetailsScreen> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController commentsController  = TextEditingController();
  final TextEditingController descriptionController  = TextEditingController();
  final TextEditingController tagsController  = TextEditingController();
  DateTime? selectedDate;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    initializeTaskInfo();
  }

  Future<void> initializeTaskInfo() async {

    final task = await ref.read(getTaskByIdProvider(widget.taskId).future);

    setState(() {
      titleController.text = task.title;
      commentsController.text = task.comments ?? '';
      descriptionController.text = task.description ?? '';     
      tagsController.text = task.tags ?? '';
      selectedDate = (task.date != null && task.date!.isNotEmpty) ? DateTime.parse(task.date!) : null;
      isCompleted = task.isCompleted == 1;
    });   
  }

  @override
  void dispose() {
    titleController.dispose();
    commentsController.dispose();
    descriptionController.dispose();
    tagsController.dispose();
    super.dispose();
  }

  void changeDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green[400],
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    final taskAsyncValue = ref.watch(getTaskByIdProvider(widget.taskId));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red[200]),
            onPressed: () async {
              await ref.read(tasksProvider.notifier).deleteTask(widget.taskId);
              showSnackbar('Task deleted!');
              if (context.mounted) context.pop();
            },
          ),
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Save')
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: taskAsyncValue.when(
            data: (task) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  // title controller
                  const Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
                  CustomTextfield(
                    hintText: 'Add a title',
                    controller: titleController,
                    icon: Icons.title,
                    validator: (title) {
                      if (title == null || title.isEmpty) {
                        return 'Title can not be null';
                      }
                      return null;
                    } ,
                  ),
        
                  // description controller
                  const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                  CustomTextfield(
                    controller: descriptionController,
                    hintText: 'No description',
                    icon: Icons.description,
                    minLines: 3,
                    maxLines: 5,
                  ),
              
                  const Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
                  CustomDateTimePicker(
                    selectedDate: selectedDate,
                    onDateSelected: changeDate,
                  ),
              
                  // comments controller
                  const Text('Comments', style: TextStyle(fontWeight: FontWeight.bold)),
                  CustomTextfield(
                    controller: commentsController,
                    hintText: 'No comments',
                    icon: Icons.comment,
                  ),
              
                  // tags controller
                  const Text('Tags', style: TextStyle(fontWeight: FontWeight.bold)),
                  CustomTextfield(
                    hintText: 'No tags',
                    controller: tagsController,
                    icon: Icons.tag,
                  ),
        
                  Row(
                    children: [
                      Switch(
                        value: isCompleted,
                        onChanged:(value) {
                          setState(() {
                            isCompleted = value;
                          });
                        },
                      ),
                      const Text('Completed')
                    ],
                  ), 
                  
                ],
              );            
            },
            error: (error, stackTrace) => Center(
              child: Text(
                'Error ocurred getting task: $error'
              ),
            ),
            loading:() => const Center(child: CircularProgressIndicator()),
          ),
        ),
      )
    );
  }
}