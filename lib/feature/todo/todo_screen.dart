import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kids_chore_app/feature/todo/task_form.dart';

import '../../core/hive_service.dart';

class TaskScreen extends StatefulWidget {
  final bool showFab;

  const TaskScreen({required this.showFab});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final HiveService _hiveService = GetIt.instance<HiveService>();
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    var taskList = await _hiveService.get('tasks');
    if (taskList != null) {
      setState(() {
        tasks = taskList;
      });
    }
  }

  void _addTask(String task) async {
    setState(() {
      tasks.add(task);
    });
    await _hiveService.put('tasks', tasks);
  }

  void _deleteTask(int index) async {
    setState(() {
      tasks.removeAt(index);
    });
    await _hiveService.put('tasks', tasks);
  }

  void _showAddTaskForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddTaskForm(onAddTask: _addTask),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/full.png'),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 4),
            child: Text("Today", style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return _buildTaskTile(index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: widget.showFab
          ? FloatingActionButton(
              onPressed: _showAddTaskForm,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildTaskTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        color: const Color(0xFFFFF2C2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          title: Text("${index + 1}. ${tasks[index]}"),
          trailing: IconButton(
            icon: const Icon(Icons.check_box_outlined),
            onPressed: () {
              _deleteTask(index);
            },
          ),
        ),
      ),
    );
  }
}
