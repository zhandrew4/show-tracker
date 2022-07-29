import 'package:flutter/material.dart';
import 'list_items.dart';

class ShowListScreen extends StatefulWidget {
  const ShowListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ShowListScreen> createState() => _ShowListPageState();
}

class _ShowListPageState extends State<ShowListScreen> {  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ), 
    );
  }
}
