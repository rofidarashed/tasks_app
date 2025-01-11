// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../tools/Colors/colors.dart';

class AppBarview extends StatelessWidget {
  const AppBarview({
    super.key,
    required Image title,
    required this.username,
  });
  final String username;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar();
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Image.asset('assets/images/user.png', fit: BoxFit.cover, height: 32),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
