import 'package:flutter/material.dart';
import 'list_items.dart';

import 'new_show_screen.dart';

class ViewListScreen extends StatefulWidget {
  const ViewListScreen({Key? key, required this.showList}) : super(key: key);

  final ShowList showList;

  @override
  State<ViewListScreen> createState() => _ViewListScreenState();
}

class _ViewListScreenState extends State<ViewListScreen> {  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.showList.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _navigateAndAddShow(context);
            },
            tooltip: "Add Show",
          ),
        ],
      ), 
      body: ListView.builder(
        itemCount: widget.showList.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(widget.showList.shows[i].name),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.showList.removeShow(i);
                });
              },
              tooltip: "Delete Show",
            ),
          );
        }
      )
    );
  }

  Future<void> _navigateAndAddShow(BuildContext context) async {
    final newShow = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const NewShowScreen(title: "Add Show"))
    );

    if (!mounted) return;

    if(newShow != null) {
      setState(() {
        widget.showList.addShow(newShow);
      });
    }
  }
}
