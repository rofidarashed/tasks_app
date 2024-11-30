import 'package:flutter/material.dart';
import '../home/widgets/task_title_bottom_sheet.dart';

import '../tools/Colors/colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const TaskTitleBottomSheet(),
        );
      },
      icon: Icon(
        Icons.add,
        color: darkPurple,
        size: 40,
      ),
    );
  }
}
