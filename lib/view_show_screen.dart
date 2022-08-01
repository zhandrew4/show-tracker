import 'package:flutter/material.dart';
import 'list_items.dart';

class ViewShowScreen extends StatefulWidget {
  const ViewShowScreen({Key? key, required this.show}) : super(key: key);

  final Show show;

  @override
  State<ViewShowScreen> createState() => _ViewShowScreenState();
}

class _ViewShowScreenState extends State<ViewShowScreen> {  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.show.name),
      ), 
    );
  }
}
