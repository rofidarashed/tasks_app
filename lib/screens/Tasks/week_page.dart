import 'package:flutter/material.dart';
import 'package:tasks_app/home/action_button.dart';
import 'package:tasks_app/home/task_list.dart';

class WeekPage extends StatelessWidget {
  const WeekPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Week'),
      ),
      body: const TaskList(),
      floatingActionButton:  ActionButton(),
    );
  }
}
