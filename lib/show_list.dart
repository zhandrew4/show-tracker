import "package:hive_flutter/hive_flutter.dart";
import "show.dart";

part "show_list.g.dart";

@HiveType(typeId: 1)
class ShowList extends HiveObject{
  @HiveField(0)
  late String name;

  @HiveField(1)
  late HiveList<Show> shows;

  ShowList({required this.name});

  @override
  String toString() {
    return "ShowList:{name: $name}";
  }
}
