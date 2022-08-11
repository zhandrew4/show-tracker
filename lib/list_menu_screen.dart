import 'package:flutter/material.dart';
import 'package:show_tracker/new_list_screen.dart';
import 'package:show_tracker/view_list_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'show.dart';
import 'show_list.dart';

class ListMenuScreen extends StatefulWidget {
  const ListMenuScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListMenuScreen> createState() => _ListMenuScreenState();
}

class _ListMenuScreenState extends State<ListMenuScreen> {

  var listBox = Hive.box<ShowList>("show_lists");
  var showBox = Hive.box<Show>("shows");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add), 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewListScreen(),
                ),
              ).then((value) => setState(() {}));
            },
            tooltip: 'Create New List',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listBox.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(
              listBox.getAt(i)!.name,
              overflow: TextOverflow.fade,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${listBox.getAt(i)!.shows.length} Shows"),
                const SizedBox(
                  width: 25,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      listBox.deleteAt(i);
                    });
                  },
                  tooltip: 'Delete List',
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewListScreen(showList: listBox.getAt(i)!),
                ),
              ).then((value) => setState(() => {}));
            },
          );
        }
      )
    );
  }
}