import 'package:flutter/material.dart';
import 'package:tasks_app/home/task_list.dart';

class MonthPage extends StatelessWidget {
  const MonthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Month'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TaskList(),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Color.fromARGB(224, 83, 50, 101),
          size: 40,
        ),
      ),
    );
  }
}
