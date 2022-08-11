import 'package:hive_flutter/hive_flutter.dart';

part "show.g.dart";

@HiveType(typeId: 2)
class Show extends HiveObject{
  @HiveField(0)
  late String name;

  @HiveField(1)
  int? score;

  @HiveField(2)
  String? comments;

  @HiveField(3)
  late bool watched;
  
  Show({required this.name}) {
    watched = false;
  }

  @override
  String toString() {
    return "Show{name: $name, score: $score, watched: $watched, comments: $comments}";
  }
}