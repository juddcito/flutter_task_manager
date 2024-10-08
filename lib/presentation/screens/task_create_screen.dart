
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';
import 'package:flutter_task_manager/presentation/providers/task_providers.dart';
import 'package:flutter_task_manager/presentation/widgets/custom_datepicker.dart';
import 'package:flutter_task_manager/presentation/widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';

final _formKey = GlobalKey<FormState>();

class TaskCreateScreen extends ConsumerStatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  TaskCreateScreenState createState() => TaskCreateScreenState();
}

class TaskCreateScreenState extends ConsumerState<TaskCreateScreen> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController commentsController  = TextEditingController();
  final TextEditingController descriptionController  = TextEditingController();
  final TextEditingController tagsController  = TextEditingController();
  DateTime? selectedDate;
  bool isCompleted = false;

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

  Future<void> addTask() async {

    String? dueDate;

    if (selectedDate != null) {
      dueDate = selectedDate.toString().substring(0, 10);
    }
        
    final tagsList = tagsController.text.split(RegExp(r'\s*,\s*')).join(','); 

    final newTask = Task(
      title: titleController.text,
      isCompleted: isCompleted ? 1 : 0,
      date: dueDate,
      comments: commentsController.text,
      description: descriptionController.text,
      tags: tagsList
    );

    await ref.read(tasksProvider.notifier).addTask(newTask);
    showSnackbar('Task added successfuly!');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
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
                      return 'Title cannot be null';
                    }
                    return null;
                  } ,
                ),
            
                // description controller
                const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                CustomTextfield(
                  controller: descriptionController,
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
                  icon: Icons.comment,
                ),
            
                // tags controller
                const Text('Tags', style: TextStyle(fontWeight: FontWeight.bold)),
                CustomTextfield(
                  controller: tagsController,
                  icon: Icons.tag,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null; // No se muestra ningún error si el campo está vacío
                    }
                    final regex = RegExp(r'^[a-zA-Z]+(?:\s*,\s*[a-zA-Z]+)*$');
                    if (!regex.hasMatch(value)) {
                      return 'Only words separated by commas are allowed';
                    }
                    return null;
                  },
                ),
                  
                Row(
                  children: [
                    const Text('Mark as completed'),
                    const Spacer(),
                    Switch(
                      value: isCompleted,
                      onChanged:(value) {
                        setState(() {
                          isCompleted = value;
                        });
                      },
                    ),                    
                  ],
                ),             
            
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate() == true) {
            await addTask();
            if (context.mounted) context.pop();
          }           
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}