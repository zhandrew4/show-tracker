import 'package:flutter/material.dart';
import 'list_items.dart';

class EditShowScreen extends StatefulWidget {
  const EditShowScreen({Key? key, required this.show}) : super(key: key);

  final Show show;

  @override
  State<EditShowScreen> createState() => _EditShowScreenState();
}

class _EditShowScreenState extends State<EditShowScreen> {

  late List<bool> isSelectedWatched;

  @override
  void initState() {
    super.initState();
    isSelectedWatched = <bool>[widget.show.watched, !widget.show.watched];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit ${widget.show.name}",
          overflow: TextOverflow.fade,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // Status Toggle Button (Watched/Unwatched)
          Row(
            children: [
              Text(
                "Status: ",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              ToggleButtons(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                constraints: BoxConstraints.tight(const Size(125, 40)),
                borderColor: const Color(0xFFb0b0b0),
                selectedBorderColor: const Color(0xFFb0b0b0),
                isSelected: isSelectedWatched,
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0; buttonIndex < isSelectedWatched.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelectedWatched[buttonIndex] = true;
                      } else {
                        isSelectedWatched[buttonIndex] = false;
                      }
                    }
                    widget.show.watched = isSelectedWatched[0];
                  });
                },
                children: [
                  SizedBox(
                    width: 150,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Watched",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold, 
                          fontSize: 18,
                          color: isSelectedWatched[0] ? Colors.green : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Unwatched",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: isSelectedWatched[1] ? Colors.red : null,
                        ),
                      ),
                    ),  
                  ),
                ],
              ),
            ],
          ),

          // Score Selector
          
        ],
      ),
    );
  }
}