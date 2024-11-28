import 'package:flutter/material.dart';
import 'package:keyboard_detection/keyboard_detection.dart';

import '../../tools/Colors/colors.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key});

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool isKeyboardOpen = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            sheetAnimationStyle: AnimationStyle(duration: Durations.long3),
            context: context,
            builder: (context) {
              return 
                  KeyboardDetection(
                  controller: KeyboardDetectionController(
                    onChanged: (state) {
                      setState(() {
                        switch (state) {
                          case KeyboardState.unknown:
                            isKeyboardOpen = false;
                          case KeyboardState.visible:
                            isKeyboardOpen = true;
                          case KeyboardState.visibling:
                            isKeyboardOpen = true;
                          case KeyboardState.hidden:
                            isKeyboardOpen = false;
                          case KeyboardState.hiding:
                            isKeyboardOpen = false;

                        }
                          print('Keyboard state changed: $state');
                      });
                    },
                  ),
                  child: Column(children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Task Title',
                              ),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
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
                      padding: EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkPurble1,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Create Task',
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ]),
                
              );
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
