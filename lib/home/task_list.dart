import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

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
                label:
                    '${item['taskTitle'] ?? 'Unnamed Task'}\n${item['taskDesc'] ?? ''}',
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
                        '${item['taskTitle'] ?? 'Unnamed Task'}\n${item['taskDesc'] ?? ''}',
                      ),
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
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.isChecked,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
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
                Expanded(child: Text(widget.label)),
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
