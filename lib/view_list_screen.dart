import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'show.dart';
import 'show_list.dart';

import 'new_show_screen.dart';
import 'view_show_screen.dart';

class ViewListScreen extends StatefulWidget {
  const ViewListScreen({Key? key, required this.showList}) : super(key: key);

  final ShowList showList;

  @override
  State<ViewListScreen> createState() => _ViewListScreenState();
}

class _ViewListScreenState extends State<ViewListScreen> {  
  var showBox = Hive.box<Show>("shows");

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.showList.name,
          overflow: TextOverflow.fade,
        ),
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
        itemCount: widget.showList.shows.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(widget.showList.shows[i].name),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.showList.shows[i].delete();
                  widget.showList.save();
                });
              },
              tooltip: "Delete Show",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewShowScreen(show: widget.showList.shows[i]),
                ),
              ).then((value) => setState(() => {}));
            },
          );
        }
      )
    );
  }

  Future<void> _navigateAndAddShow(BuildContext context) async {
    final newShow = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const NewShowScreen())
    );

    if (!mounted) return;

    if(newShow != null) {
      setState(() {
        showBox.add(newShow);
        widget.showList.shows.add(newShow);
        widget.showList.save();
      });
    }
  }
}
