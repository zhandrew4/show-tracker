import 'package:flutter/material.dart';
import 'show.dart';
import 'show_list.dart';

class NewShowScreen extends StatefulWidget {
  const NewShowScreen({Key? key}) : super(key: key);

  @override 
  State<NewShowScreen> createState() => _NewShowScreenState();
}

class _NewShowScreenState extends State<NewShowScreen> {
  final _showNameTextController = TextEditingController(); 

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Show"),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _showNameTextController,
                decoration: const InputDecoration(hintText: 'Show Name'),
              ),
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.pop(context, Show(name: _showNameTextController.value.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}