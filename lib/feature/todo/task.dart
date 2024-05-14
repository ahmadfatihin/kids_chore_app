import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  int priority; // Number of stars

  @HiveField(3)
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    this.priority = 0,
    this.isCompleted = false,
  });
}
