import 'package:flutter/material.dart';
import 'package:show_tracker/new_list_screen.dart';
import 'package:show_tracker/view_list_screen.dart';
import 'list_items.dart';

class ListMenuScreen extends StatefulWidget {
  const ListMenuScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListMenuScreen> createState() => _ListMenuScreenState();
}

class _ListMenuScreenState extends State<ListMenuScreen> {

  final _lists = <ShowList>[];

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
            title: Text(_lists[i].name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${_lists[i].length} Shows"),
                const SizedBox(
                  width: 25,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _lists.remove(_lists[i]);
                    });
                  }
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewListScreen(showList: _lists[i]),
                ),
              ).then((value) => setState(() => {}));
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
        _lists.add(newList);
      });
    }
  }
}