import 'package:flutter/material.dart';

class PlannedPage extends StatelessWidget {
  const PlannedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Plans'),
      ),
      body: Expanded(
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView(
            children: const [
              TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Heading",
                ),
                scrollPadding: EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                maxLines: null,
                autofocus: true,
              ),
              TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Enter your Text...",
                ),
                scrollPadding: EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autofocus: true,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container();
              });
        },
        icon: const Icon(
          Icons.add,
          color: Color.fromARGB(224, 83, 50, 101),
          size: 40,
        ),
      ),
    );
  }
}
