import 'package:flutter/material.dart';
import 'package:tasks_app/home/task_list.dart';

class ImportantPage extends StatelessWidget {
  const ImportantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Important'),
      ),
      body: const TaskList(),
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
