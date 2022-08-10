class ShowList {
  late String name;
  late List shows;

  ShowList({required this.name}) {
    shows = <Show>[];
  }

  ShowList.fromMap(Map m) {
    name = m["name"];
    shows = m["shows"].map((show) {
      return Show.fromMap(show);
    }).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "shows": shows.map((show) {
        return show.toMap();
      }).toList(),
    };
  }

  void addShow(Show show) {
    shows.add(show);
  }

  void removeShow(int index) {
    shows.removeAt(index);
  }

  @override
  String toString() {
    return "ShowList:{name: $name, shows: $shows}";
  }
}

class Show {
  late String name;
  int? score;
  String? comments;
  late bool watched;
  
  Show({required this.name}) {
    watched = false;
  }

  Show.fromMap(Map m) {
    name = m["name"];
    score = m["score"];
    comments = m["comments"];
    watched = m["watched"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "score": score,
      "comments": comments,
      "watched": watched,
    };
  }

  @override
  String toString() {
    return "Show{name: $name, score: $score, watched: $watched, comments: $comments}";
  }
}