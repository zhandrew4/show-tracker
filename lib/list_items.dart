class ShowList {
  String name;
  late int length;
  var shows = <Show>[];

  ShowList({required this.name}) {
    length = 0;
  }

  void addShow(Show newShow) {
    shows.add(newShow);
    length ++;
  }
}

class Show {
  String name;
  late int score;
  late String comments;
  late bool watched = false;
  
  Show({required this.name});
}