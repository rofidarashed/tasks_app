// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../screens/Tasks/month_page.dart';
import '../screens/Tasks/planned_page.dart';
import '../screens/Tasks/today_page.dart';
import '../screens/Tasks/week_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(235, 206, 179, 208)),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/user.png'),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Important'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.sunny),
              title: Text('Tasks of today'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TodayPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_view_week),
              title: Text('Goals for Week'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const WeekPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Goals for Month'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MonthPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.notes),
              title: const Text('Planned'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlannedPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        );
      }),
    );
  }
}
