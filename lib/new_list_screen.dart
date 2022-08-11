import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'show.dart';
import 'show_list.dart';

class NewListScreen extends StatefulWidget {
  const NewListScreen({Key? key}) : super(key: key);

  @override 
  State<NewListScreen> createState() => _NewListScreenState();
}

class _NewListScreenState extends State<NewListScreen> {
  final _listNameTextController = TextEditingController();

  var listBox = Hive.box<ShowList>("show_lists");
  var showBox = Hive.box<Show>("shows");

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New List"),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _listNameTextController,
                decoration: const InputDecoration(hintText: 'List Name'),
              ),
            ),
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                ShowList newList = ShowList(name: _listNameTextController.value.text);
                newList.shows = HiveList(showBox);
                listBox.add(newList);
                Navigator.pop(context);
              }
            ),
          ],
        ),
      ),
    );
  }
}