// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShowAdapter extends TypeAdapter<Show> {
  @override
  final int typeId = 2;

  @override
  Show read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Show(
      name: fields[0] as String,
    )
      ..score = fields[1] as int?
      ..comments = fields[2] as String?
      ..watched = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Show obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.comments)
      ..writeByte(3)
      ..write(obj.watched);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
