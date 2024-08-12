
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/presentation/widgets/custom_textfield.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController commentsController  = TextEditingController();
  final TextEditingController descriptionController  = TextEditingController();
  final TextEditingController tagsController  = TextEditingController();
  DateTime? selectedDate;
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              // title controller
              const Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
              CustomTextfield(
                hintText: 'Add a title',
                controller: titleController,
                icon: Icons.title,
              ),
          
              // description controller
              const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
              CustomTextfield(
                controller: descriptionController,
                icon: Icons.description,
                minLines: 3,
                maxLines: 5,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
    );
  }
}