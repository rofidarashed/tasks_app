import 'package:flutter/material.dart';
import '../../home/app_bar.dart';
import '../../home/drawer_widget.dart';
import '../../home/home_page.dart';
import '../../tools/Colors/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: white,
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        appBar: const CustomAppBar(),
        body: HomePage(),
      ),
    );
  }
}
