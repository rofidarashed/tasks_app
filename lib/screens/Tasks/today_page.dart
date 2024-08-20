import 'package:flutter/material.dart';
import 'package:tasks_app/screens/home/task_list.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskList(),
      ],
    );
  }
}
