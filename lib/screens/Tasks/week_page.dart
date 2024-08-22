import 'package:flutter/material.dart';
import 'package:tasks_app/home/task_list.dart';

class WeekPage extends StatelessWidget {
  const WeekPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Week'),
      ),
      body: const TaskList(),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add_rounded,
          color: Color.fromARGB(224, 83, 50, 101),
          size: 40,
        ),
      ),
    );
  }
}
