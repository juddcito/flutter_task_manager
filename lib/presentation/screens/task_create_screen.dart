
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/domain/entities/task.dart';
import 'package:flutter_task_manager/presentation/providers/task_providers.dart';
import 'package:flutter_task_manager/presentation/widgets/custom_datepicker.dart';
import 'package:flutter_task_manager/presentation/widgets/custom_textfield.dart';

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

  void addTask() {

    final dueDate = selectedDate.toString().substring(0, 10);    
    final tagsList = tagsController.text.split(RegExp(r'\s*,\s*')).join(','); 

    final newTask = Task(
      title: titleController.text,
      isCompleted: isCompleted ? 1 : 0,
      date: dueDate,
      comments: commentsController.text,
      description: descriptionController.text,
      tags: tagsList
    );
    ref.read(tasksProvider.notifier).addTask(newTask);
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
                      return 'Title can not be null';
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
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _formKey.currentState!.validate() == true ? addTask() : null;
          //context.pop();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}