// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CorporateAdapter extends TypeAdapter<Corporate> {
  @override
  final int typeId = 1;

  @override
  Corporate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Corporate(
      name: fields[0] as String,
      date: fields[1] as String,
      forwardAmount: fields[2] as String,
      paidAmount: fields[3] as String,
      remainingAmount: fields[4] as String,
      payHistory: (fields[5] as List)
          .map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, Corporate obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.forwardAmount)
      ..writeByte(3)
      ..write(obj.paidAmount)
      ..writeByte(4)
      ..write(obj.remainingAmount)
      ..writeByte(5)
      ..write(obj.payHistory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CorporateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
