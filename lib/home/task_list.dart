import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/trash.dart';

// ignore: must_be_immutable
class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Map<String, dynamic>> checkedItems = [];
  List<Map<String, dynamic>> uncheckedItems = [];

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance.collection('tasks').snapshots().listen((event) {
      setState(() {
        uncheckedItems = [];
      });
      for (var doc in event.docs) {
        final taskDetails = doc.data()["taskDetails"];

        if (taskDetails != null && taskDetails is Map<String, dynamic>) {
          setState(() {
            uncheckedItems.add(taskDetails); // Add the taskDetails map
          });
        }
      }
    });
  }

  void _handleCheckboxChange(Map<String, dynamic> item, bool isChecked) {
    setState(() {
      if (isChecked) {
        uncheckedItems.remove(item);
        checkedItems.add(item);
      } else if (!isChecked) {
        checkedItems.remove(item);
        uncheckedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView(
        children: [
          ...uncheckedItems.map((item) => LabeledCheckbox(
                title: '${item['taskTitle'] ?? 'Unnamed Task'}',
                desc: '${item['taskDesc'] ?? ''}',
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                isChecked: false,
                onChanged: (bool newValue) {
                  _handleCheckboxChange(item, newValue);
                },
              )),
          ExpansionTile(
            title: const Text('Completed'),
            children: checkedItems
                .map((item) => ListTile(
                      title: Text(
                        '${item['taskTitle'] ?? 'Unnamed Task'}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${item['taskDesc'] ?? ''}'),
                      trailing: Checkbox(
                        value: true,
                        onChanged: (bool? newValue) {
                          _handleCheckboxChange(item, newValue!);
                        },
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LabeledCheckbox extends StatefulWidget {
  LabeledCheckbox({
    super.key,
    required this.title,
    required this.desc,
    required this.padding,
    required this.isChecked,
    required this.onChanged,
    this.isDeleted = false,
  });

  final String title;
  final String desc;
  final EdgeInsets padding;
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  bool? isDeleted;

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  late bool isDeleted;

  @override
  void initState() {
    super.initState();
    isDeleted = widget.isDeleted!;
  }

  void deleteTask() {
    setState(() {
      isDeleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            widget.onChanged(!widget.isChecked);
          },
          child: Padding(
            padding: widget.padding,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.desc),
                  ],
                )),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Trash()));
                    deleteTask;
                  },
                ),
                Checkbox(
                  value: widget.isChecked,
                  onChanged: (bool? newValue) {
                    widget.onChanged(newValue!);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
