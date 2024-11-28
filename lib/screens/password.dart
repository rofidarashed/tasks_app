// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../screens/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../tools/Colors/colors.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: white,
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  bool view = true;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'TasksApp',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 50,
            color: Color.fromARGB(255, 6, 6, 6),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 9),
          child: TextField(
            obscureText: view,
            controller: _controller,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                errorText: _validate ? 'Required' : null,
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        if (view) {
                          view = false;
                        } else {
                          view = true;
                        }
                      });
                    },
                    icon: Icon(
                        view == true ? Icons.remove_red_eye : Icons.password))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 9),
          child: TextField(
            obscureText: view,
            controller: _controller1,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Confirm password',
                errorText: _validate ? 'Required' : null,
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        if (view) {
                          view = false;
                        } else {
                          view = true;
                        }
                      });
                    },
                    icon: Icon(
                        view == true ? Icons.remove_red_eye : Icons.password))),
          ),
        ),
        Builder(
          builder: (context) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: darkPurble1,
              ),
              onPressed: () {
                setState(() {
                  _validate = _controller.text.isEmpty;
                });
                if (_validate) {
                } else if (_controller.text != _controller1.text) {
                  Fluttertoast.showToast(
                      msg: "passwords must be the same",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: white,
                      fontSize: 16.0);
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }
              },
              child:  Text(
                'Submit',
                style: TextStyle(
                  color: white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
