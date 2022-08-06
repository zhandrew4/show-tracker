import 'package:flutter/material.dart';
import 'package:show_tracker/new_list_screen.dart';
import 'package:show_tracker/view_list_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'list_items.dart';

class ListMenuScreen extends StatefulWidget {
  const ListMenuScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListMenuScreen> createState() => _ListMenuScreenState();
}

class _ListMenuScreenState extends State<ListMenuScreen> {

  var box = Hive.box("show_tracker_app");

  final _lists = <ShowList>[];

  @override
  void initState() {
    super.initState();
    getLists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add), 
            onPressed: () {
              _navigateAndAddList(context);
            },
            tooltip: 'Create New List',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _lists.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(
              _lists[i].name,
              overflow: TextOverflow.fade,
              
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${_lists[i].shows.length} Shows"),
                const SizedBox(
                  width: 25,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _lists.remove(_lists[i]);
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
                  builder: (context) => ViewListScreen(showList: _lists[i]),
                ),
              ).then((value) {
                setState(() => {});
                updateLists();
              });
            },
          );
        }
      )
    );
  }

  Future<void> _navigateAndAddList(BuildContext context) async {
    final newList = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const NewListScreen(title: "New List"))
    );

    if (!mounted) return;

    if(newList != null) {
      setState(() {
        addList(newList);
      });
    }
  }

  getLists() {
    for (String key in box.keys) {
      _lists.add(ShowList.fromMap(box.get(key)));
    }
  }

  addList(ShowList newList) {
    setState(() {
      _lists.add(newList);
    });
    box.put(newList.name, newList.toMap());
  }

  updateLists() {
    for (ShowList list in _lists) {
      box.put(list.name, list.toMap());
    }
  }
  
}