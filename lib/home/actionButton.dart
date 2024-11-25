import 'package:flutter/material.dart';
import 'package:tasks_app/tools/Colors/colors.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key});

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Task Title',
                            hintText: 'Task Title',
                          ),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Description...",
                              labelText: 'Description'),
                          scrollPadding: EdgeInsets.all(20.0),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkPurble1,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Create Task',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ]);
            });
      },
      icon: Icon(
        Icons.add,
        color: darkPurple,
        size: 40,
      ),
    );
  }
}
