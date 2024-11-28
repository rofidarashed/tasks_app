import 'package:flutter/material.dart';
import 'package:tasks_app/home/action_button.dart';

class PlannedPage extends StatelessWidget {
  const PlannedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Plans'),
      ),
      body: Expanded(
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView(
            children: const [
              TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Heading",
                ),
                scrollPadding: EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                maxLines: null,
                autofocus: true,
              ),
              TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Enter your Text...",
                ),
                scrollPadding: EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autofocus: true,
              )
            ],
          ),
        ),
      ),
      floatingActionButton:  ActionButton(),
    );
  }
}
