// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShowListAdapter extends TypeAdapter<ShowList> {
  @override
  final int typeId = 1;

  @override
  ShowList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShowList(
      name: fields[0] as String,
    )..shows = (fields[1] as HiveList).castHiveList();
  }

  @override
  void write(BinaryWriter writer, ShowList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.shows);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
