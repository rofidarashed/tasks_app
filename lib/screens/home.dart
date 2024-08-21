import 'package:flutter/material.dart';
import 'package:tasks_app/home/app_bar.dart';
import 'package:tasks_app/home/drawer_widget.dart';
import 'package:tasks_app/home/home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        drawer: Drawer(
          child: DrawerWidget(),
        ),
        appBar: CustomAppBar(),
        body: HomePage(),
      ),
    );
  }
}
