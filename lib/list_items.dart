class ShowList {
  String name;
  int length = 0;
  var list = <Show>[];

  ShowList({required this.name});
}

class Show {
  String name;
  late int score;
  late String comments;
  
  Show({required this.name});
}