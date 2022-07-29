import 'package:flutter/material.dart';
import 'list_items.dart';

class NewListScreen extends StatefulWidget {
  const NewListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override 
  State<NewListScreen> createState() => _NewListScreenState();
}

class _NewListScreenState extends State<NewListScreen> {
  final _listNameTextController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                Navigator.pop(context, ShowList(name: _listNameTextController.value.text));
              }
            ),
          ],
        ),
      ),
    );
  }
}