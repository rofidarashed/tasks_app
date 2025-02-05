import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_detection/keyboard_detection.dart';
import '../../tools/Colors/colors.dart';

class TaskTitleBottomSheet extends StatefulWidget {
  const TaskTitleBottomSheet({super.key});

  @override
  State<TaskTitleBottomSheet> createState() => _TaskTitleBottomSheetState();
}

class _TaskTitleBottomSheetState extends State<TaskTitleBottomSheet> {
  final taskTitleController = TextEditingController();
  final taskDescController = TextEditingController();
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: TextFormField(
                      controller: taskTitleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Task Title',
                      ),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: TextFormField(
                      controller: taskDescController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Description'),
                      scrollPadding: const EdgeInsets.all(20.0),
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
                onPressed: () {
                  final taskDetails = {
                    'taskTitle': taskTitleController.text,
                    'taskDesc': taskDescController.text,
                  };

                  _addTasks(taskDetails);
                },
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

  Future _addTasks(Map<String, String> taskDetails) async {
    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('tasks').add({'taskDetails': taskDetails,});
    String taskId = docRef.id;
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).update(
      {'id': taskId},
    );

    _clearAll();
  }

  void _clearAll() {
    taskTitleController.text = '';
    taskDescController.text = '';
  }
}
