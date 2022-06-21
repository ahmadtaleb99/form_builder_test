import 'package:form_builder_test/Widgets/IDrawable.dart';
import 'package:form_builder_test/Widgets/Matrix/fields/MatrixDatePickerWidget.dart';
import 'package:form_builder_test/dynamic%20form/IFormModel.dart';
import 'package:hive/hive.dart';

import '../matrix.dart';


part 'MatrixDatePicker.g.dart';


@HiveType(typeId: 64)
class MatrixDatePicker implements IFormModel {

  @HiveField(1)
  String name;
  @HiveField(2)
  String label;
  MatrixDatePicker({
    required this.name,
    required this.label,
     this.value
  });

  factory MatrixDatePicker.fromJson(dynamic json){
    return MatrixDatePicker(name: json['fieldName'], label: json['label']);
  }


  @override
  @HiveField(3)
  var value;



  @override
  FormElementWidget toWidget() {
    // TODO: implement toWidget
    return MatrixDatePickerWidget(label: label, name: name, value: value);
  }

  @override
  String valueToString() {
    // TODO: implement valueToString
    return value.toString();
  }
  @override
  IFormModel copyWith({
    String? name,
    String? label,
    String? value,
  }) {

    return MatrixDatePicker(
      name: name ?? this.name,
      label: label ?? this.label,
      value: value ?? this.value,

    );

  }

}
