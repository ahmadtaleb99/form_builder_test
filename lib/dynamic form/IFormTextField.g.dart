// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IFormTextField.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IFormTextFieldAdapter extends TypeAdapter<IFormTextField> {
  @override
  final int typeId = 30;

  @override
  IFormTextField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IFormTextField(
      label: fields[1] as String,
      name: fields[2] as String,
      deactivate: fields[3] as bool,
      isHidden: fields[4] as bool,
      required: fields[5] as bool,
      isReadOnly: fields[6] as bool,
      visible: fields[7] as bool?,
      showIfValueSelected: fields[8] as bool,
      showIfFieldValue: fields[9] as String?,
      showIfIsRequired: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, IFormTextField obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.deactivate)
      ..writeByte(4)
      ..write(obj.isHidden)
      ..writeByte(5)
      ..write(obj.required)
      ..writeByte(6)
      ..write(obj.isReadOnly)
      ..writeByte(7)
      ..write(obj.visible)
      ..writeByte(8)
      ..write(obj.showIfValueSelected)
      ..writeByte(9)
      ..write(obj.showIfFieldValue)
      ..writeByte(10)
      ..write(obj.showIfIsRequired);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IFormTextFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
