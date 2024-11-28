import 'package:flutter/material.dart';
import '../../home/action_button.dart';
import '../../home/task_list.dart';

class MonthPage extends StatelessWidget {
  const MonthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Month'),
      ),
      body: TaskList(),
      floatingActionButton:  ActionButton(),
    );
  }
}
