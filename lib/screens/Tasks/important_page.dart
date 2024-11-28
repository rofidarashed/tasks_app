import 'package:flutter/material.dart';
import '../../home/action_button.dart';

class ImportantPage extends StatelessWidget {
  const ImportantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Important'),
      ),
      body: const SingleChildScrollView(),
      floatingActionButton: ActionButton(),
    );
  }
}
