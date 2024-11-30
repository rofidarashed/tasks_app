import 'package:flutter/material.dart';
import 'package:keyboard_detection/keyboard_detection.dart';
import '../../tools/Colors/colors.dart';

class TaskTitleBottomSheet extends StatefulWidget {
  const TaskTitleBottomSheet({super.key});

  @override
  State<TaskTitleBottomSheet> createState() => _TaskTitleBottomSheetState();
}

class _TaskTitleBottomSheetState extends State<TaskTitleBottomSheet> {
  bool isKeyboardOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (isKeyboardOpen ? 0.7 : 0.4),
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: KeyboardDetection(
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Task Title',
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    indent: 15,
                    endIndent: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, labelText: 'Description'),
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
                child: Text(
                  'Create Task',
                  style: TextStyle(
                    color: white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
