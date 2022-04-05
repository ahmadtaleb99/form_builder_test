import 'package:flutter/src/widgets/framework.dart';
import 'package:form_builder_test/Widgets/DrawTextArea.dart';
import 'package:form_builder_test/Widgets/IDrawable.dart';
import 'package:form_builder_test/dynamic%20form/IFormModel.dart';
import 'package:hive/hive.dart';

part 'IFormTextArea.g.dart';

@HiveType(typeId: 49)
class IFormTextArea implements IFormModel {
  dynamic _parameters;

  @HiveField(1)
  String label;

  @HiveField(2)
  String name;

  @HiveField(3)
  bool deactivate;

  @HiveField(4)
  bool isHidden;

  @HiveField(5)
  bool required;

  @HiveField(6)
  bool isReadOnly;

  @HiveField(7)
  bool? visible;
  @HiveField(8)
  bool showIfValueSelected;
  @HiveField(9)
  String? showIfFieldValue;
  @HiveField(10)
  bool? showIfIsRequired;
  @HiveField(11)
  int minLength;
  @HiveField(12)
  int maxLength;


  @HiveField(13)
  dynamic value;
  IFormTextArea({
    required this.label,
    required this.name,
    required this.deactivate,
    required this.isHidden,
    required this.required,
    required this.isReadOnly,
    this.visible,
    required this.showIfValueSelected,
    this.showIfFieldValue,
    this.showIfIsRequired,
    required this.minLength,
    required this.maxLength,});

  factory IFormTextArea.fromJson(json) {
    return IFormTextArea(
        label: json['label'],
        required: json['required'],
      minLength: json['minlength'],
      maxLength: json['maxlength'],
        showIfIsRequired: json['showIfIsRequired'],
        showIfFieldValue: json['showIfFieldValue'],
        isHidden: json['isHidden'],
        isReadOnly: json['isReadOnly'],
        showIfValueSelected: json['showIfLogicCheckbox'],
        name: json['name'],
        visible: json['showIfLogicCheckbox'] == true ? false : true,
        deactivate: json['deactivate'], );
  }
  @override
  FormElement toWidget({parameters}) {
    return DrawTextArea(
      minLength: this.minLength,
      maxLength: this.maxLength,
      label: this.label,
      required: this.required,
      showIfIsRequired: this.showIfIsRequired,
      showIfFieldValue: this.showIfFieldValue,
      visible:  this.visible,
      value: this.value,

      showIfValueSelected: this.showIfValueSelected,
      name: this.name,  );
  }

  @override
  void setParameters(parametrs) {
    _parameters = parametrs;
  }

  @override
  Map<String, dynamic> fomrElementtoJson(FormElement formElement) {
    // TODO: implement fomrElementtoJson
    throw UnimplementedError();
  }



}
