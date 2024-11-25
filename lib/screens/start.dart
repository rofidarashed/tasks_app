import 'package:flutter/material.dart';
import 'package:tasks_app/screens/password.dart';
import 'package:tasks_app/tools/Colors/colors.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  bool _validate = false;
  bool _validate1 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
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
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Image(
                image: AssetImage('images/To-Do-Task.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 9),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter your email',
                  errorText: _validate ? 'Required' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 3),
              child: TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter your username',
                  errorText: _validate1 ? 'Required' : null,
                ),
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
                      _validate1 = _controller1.text.isEmpty;
                    });
                    if (_validate || _validate1) {
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Password()));
                    }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
