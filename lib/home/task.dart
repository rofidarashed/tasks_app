import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tasks extends StatefulWidget {
  final String title;
  final String description;
  bool? isChecked;
  bool? isDeleted;

  Tasks({
    super.key,
    required this.title,
    required this.description,
    this.isChecked = false,
    this.isDeleted = false,
  });

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  late bool isChecked;
  late bool isDeleted;


  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked!;
    isDeleted = widget.isDeleted!;
  }

  void toggleChecked() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  void deleteTask() {
    setState(() {
      isDeleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isDeleted) {
      return SizedBox.shrink(); // Returns an empty widget if the task is deleted
    }

    return ListTile(
      leading: Checkbox(
        value: isChecked,
        onChanged: (value) {
          if (value != null) toggleChecked();
        },
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(widget.description),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: deleteTask,
      ),
    );
  }
}

  