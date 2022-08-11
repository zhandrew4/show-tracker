import 'package:flutter/material.dart';
import 'show.dart';

class EditShowScreen extends StatefulWidget {
  const EditShowScreen({Key? key, required this.show}) : super(key: key);

  final Show show;

  @override
  State<EditShowScreen> createState() => _EditShowScreenState();
}

class _EditShowScreenState extends State<EditShowScreen> {

  late List<bool> isSelectedWatched;

  final _commentsTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isSelectedWatched = <bool>[widget.show.watched, !widget.show.watched];
    _commentsTextController.text = widget.show.comments ?? "None";
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
                    if (!widget.show.watched) {
                      widget.show.score = null;
                    }
                  });
                },
                children: [
                  SizedBox(
                    width: 150,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Watched",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, 
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isSelectedWatched[1] ? Colors.red : null,
                        ),
                      ),
                    ),  
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 30,
            thickness: 2,
            color: Colors.grey.shade400,
          ),

          // Score Selector
          Row(
            children: [
              Text(
                "Score: ",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              DropdownButton<String>(
                value: widget.show.score == null ? "None" : "${widget.show.score}",
                icon: const Icon(Icons.arrow_drop_down),
                alignment: Alignment.centerLeft,
                style: Theme.of(context).textTheme.bodyMedium,
                onChanged: !widget.show.watched ? null : (String? newValue) {
                  setState(() {
                    if (newValue == "None") {
                      widget.show.score = null;
                    } else {
                      widget.show.score = int.parse(newValue!);
                    }
                  });
                },
                items: <String>["None", "1", "2", "3", "4", "5"].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              ),
            ],
          ),
          Divider(
            height: 30,
            thickness: 2,
            color: Colors.grey.shade400,
          ),

          // Comments Editor
          Text(
            "Comments: ",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            autocorrect: true,
            controller: _commentsTextController,
            minLines: 1,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                fixedSize: MaterialStateProperty.resolveWith<Size?>((Set<MaterialState> states) => const Size(125, 40))
              ),
              onPressed: () {
                setState(() {
                  if (_commentsTextController.value.text.trim() == "") {
                    widget.show.comments = null;
                  } else {
                    widget.show.comments = _commentsTextController.value.text.trim();
                  }
                  widget.show.save();
                });
              }, 
              child: Text(
                "Save", 
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}