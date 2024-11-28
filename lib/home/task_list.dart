import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<String> checkedItems = [];
  List<String> uncheckedItems = [];

  void _handleCheckboxChange(String label, bool isChecked) {
    setState(() {
      if (isChecked) {
        uncheckedItems.remove(label);
        checkedItems.add(label);
      } else if (!isChecked) {
        checkedItems.remove(label);
        uncheckedItems.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          children: [
            ...uncheckedItems.map((item) => LabeledCheckbox(
                  label: item,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  isChecked: false,
                  onChanged: (bool newValue) {
                    _handleCheckboxChange(item, newValue);
                  },
                )),
            ExpansionTile(
              title: const Text('Completed'),
              children: checkedItems
                  .map((item) => ListTile(
                        title: Text(item),
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
