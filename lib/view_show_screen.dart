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
        title: Text(
          widget.show.name,
          overflow: TextOverflow.fade,
        ),
      ), 
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Text(
            widget.show.watched ? "Watched" : "Unwatched",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Divider(
            height: 30,
            thickness: 2,
            color: Colors.grey.shade400,
          ),
          RichText(
            text: TextSpan(
              text: "Score: ",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: widget.show.score != null ? "${widget.show.score}/10" : "No Score",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            textAlign: TextAlign.left,
            overflow: TextOverflow.fade,
          ),
          Divider(
            height: 30,
            thickness: 2,
            color: Colors.grey.shade400,
          ),
          Text(
            "Comments:",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            widget.show.comments ?? "None",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
