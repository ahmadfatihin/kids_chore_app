import 'package:flutter/material.dart';

class AddTaskForm extends StatefulWidget {
  final Function(String) onAddTask;

  AddTaskForm({required this.onAddTask});

  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onAddTask(_taskController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _taskController,
                decoration: InputDecoration(labelText: 'Task'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
