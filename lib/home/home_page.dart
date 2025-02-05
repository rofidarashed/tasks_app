// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:freestyle_speed_dial/freestyle_speed_dial.dart';
import 'package:tasks_app/home/task_list.dart';
import '../screens/Tasks/month_page.dart';
import '../screens/Tasks/planned_page.dart';
import '../screens/Tasks/today_page.dart';
import '../screens/Tasks/week_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTaskProgress(),
        Expanded(
          child: TaskList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 30,
                right: 30,
              ),
              child: SpeedDialBuilder(
                buttonAnchor: Alignment.bottomCenter,
                itemAnchor: Alignment.center,
                buttonBuilder: (context, isActive, toggle) =>
                    FloatingActionButton(
                  shape: CircleBorder(),
                  onPressed: toggle,
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubicEmphasized,
                    turns: isActive ? 0.125 : 0,
                    child: const Icon(Icons.add),
                  ),
                ),
                itemBuilder: (context, Widget item, i, animation) {
                  // radius in relative units to each item
                  const radius = 1.8;
                  // angle in radians
                  final angle = i * (pi / 5) + pi;

                  final targetOffset = Offset(
                    radius * cos(angle),
                    radius * sin(angle),
                  );

                  final offsetAnimation = Tween<Offset>(
                    begin: Offset.zero,
                    end: targetOffset,
                  ).animate(animation);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: FadeTransition(
                      opacity: animation,
                      child: item,
                    ),
                  );
                },
                items: [
                  FloatingActionButton.small(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TodayPage()));
                    },
                    child: const Icon(Icons.sunny),
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WeekPage()));
                    },
                    child: const Icon(Icons.calendar_view_week),
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MonthPage()));
                    },
                    child: const Icon(Icons.calendar_month),
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlannedPage()));
                    },
                    child: const Icon(Icons.add_box),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  CircularPercentIndicator _buildTaskProgress() {
    return CircularPercentIndicator(
      radius: 110,
      lineWidth: 20,
      backgroundColor: Color.fromARGB(255, 206, 224, 241),
      progressColor: Color.fromARGB(201, 219, 152, 255),
      circularStrokeCap: CircularStrokeCap.round,
      percent: 0.6,
      center: SizedBox(
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              '60%',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 98, 1, 86),
              ),
            ),
            Text(
              'Done for today',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 98, 1, 86),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
