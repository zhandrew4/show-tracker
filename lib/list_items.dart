class ShowList {
  String name;
  late int length;
  var shows = <Show>[];

  ShowList({required this.name}) {
    length = 0;
  }

  void addShow(Show newShow) {
    shows.add(newShow);
    length++;
  }

  void removeShow(int index) {
    shows.removeAt(index);
    length--;
  }
}

class Show {
  String name;
  int? score;
  String? comments;
  bool watched = false;
  
  Show({required this.name});
}