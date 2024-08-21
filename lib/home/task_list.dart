import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<String> checkedItems = [];
  List<String> uncheckedItems = ['vjv'];

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
    return Column(
      children: [
        ...uncheckedItems.map((item) => LabeledCheckbox(
              label: item,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: false,
              onChanged: (bool newValue) {
                _handleCheckboxChange(item, newValue);
              },
            )),
        ExpansionTile(
          title: Text('Completed'),
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
    );
  }
}

class LabeledCheckbox extends StatefulWidget {
  LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            widget.onChanged(!widget.value);
          },
          child: Padding(
            padding: widget.padding,
            child: Row(
              children: <Widget>[
                Expanded(child: Text(widget.label)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (isPressed) {
                        isPressed = false;
                      } else {
                        isPressed = true;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: (isPressed)
                        ? Color.fromARGB(243, 179, 124, 208)
                        : Color.fromARGB(255, 129, 134, 135),
                  ),
                ),
                Checkbox(
                  value: widget.value,
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
