import 'package:flutter/material.dart';
import 'list_items.dart';

class ListMenu extends StatefulWidget {
  const ListMenu({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListMenu> createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {

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
            )
          );
        }
      )
    );
  }

  Future<void> _navigateAndAddList(BuildContext context) async {
    final newList = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const NewListPage(title: "New List"))
    );

    if (!mounted) return;

    if(newList != null) {
      setState(() {
        _lists.add(newList);
      });
    }
  }
}