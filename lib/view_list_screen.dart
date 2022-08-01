import 'package:flutter/material.dart';
import 'list_items.dart';

class ViewListScreen extends StatefulWidget {
  const ViewListScreen({Key? key, required this.list}) : super(key: key);

  final ShowList list;

  @override
  State<ViewListScreen> createState() => _ViewListScreenState();
}

class _ViewListScreenState extends State<ViewListScreen> {  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: null, 
            tooltip: "Add Show",
            ),
        ],
      ), 
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(widget.list.shows[i].name),
          );
        }
      )
    );
  }
}
