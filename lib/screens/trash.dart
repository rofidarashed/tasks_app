import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/tools/Colors/colors.dart';

// ignore: must_be_immutable
class Trash extends StatefulWidget {
  Trash({
    super.key,
    this.isDeleted = false,
  });

  bool? isDeleted;

  @override
  _TrashState createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  late bool isDeleted;

  List<Map<String, dynamic>> deletedItems = [];

  void initState() {
    super.initState();
    isDeleted = widget.isDeleted!;

    FirebaseFirestore.instance.collection('tasks').snapshots().listen((event) {
      setState(() {
        deletedItems = [];
      });
      for (var doc in event.docs) {
        final taskDetails = doc.data()["taskDetails"];

        if (isDeleted) {
          setState(() {
            deletedItems.add(taskDetails); // Add the taskDetails map
          });
        }
      }
    });
  }

  void deleteTask() {
    setState(() {
      isDeleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: const Text('trash'),
      ),
    
    body: deletedItems.isEmpty
        ? Center(
            child: Text(
              'No deleted items',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          )
        : ListView.builder(
            itemCount: deletedItems.length,
            itemBuilder: (context, index) {
              final taskDetails = deletedItems[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    taskDetails['title'] ?? 'No Title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    taskDetails['description'] ?? 'No Description',
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.restore_from_trash, color: Colors.red),
                    onPressed: () {
                      // Handle restore action here
                    },
                  ),
                ),
                              );
            },
          ),

    );
  }
}
