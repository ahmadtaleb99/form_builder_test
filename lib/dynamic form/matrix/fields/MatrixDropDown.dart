import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_builder_test/Widgets/IDrawable.dart';
import 'package:form_builder_test/Widgets/Matrix/fields/MatrixDropDownWidget.dart';
import 'package:form_builder_test/dynamic%20form/CheckboxItem.dart';
import 'package:form_builder_test/dynamic%20form/IFormModel.dart';
import 'package:form_builder_test/dynamic%20form/RadioItem.dart';
import 'package:hive/hive.dart';

import '../../DropDownItem.dart';
import '../matrix.dart';


part 'MatrixDropDown.g.dart';


@HiveType(typeId: 63)

class MatrixDropDown implements IFormModel {

  @HiveField(1)
  String name;


  @HiveField(2)

  String label;


  @HiveField(3)
  List<DropDownItem> values;


  MatrixDropDown({
    required this.name,
    required this.label,
    required this.values,
    this.value
  });

  factory MatrixDropDown.fromJson(dynamic json){
    return MatrixDropDown(name: json['fieldName'], label: json['label'],
      values: List<DropDownItem>.from(json['multipleOptions'].map((e) => DropDownItem.fromJson(e)).toList()),

    );
  }


  @override
  @HiveField(4)
  var value;



  @override
  FormElementWidget toWidget() {

    // TODO: implement toWidget
    return MatrixDropDownWidget(label: label, name: name, value: value, values: values);
  }

  @override
  String valueToString() {
    // TODO: implement valueToString
    throw UnimplementedError();
  }

  @override
  IFormModel copyWith({
    String? name,
    String? label,
    String? value,
    List<DropDownItem>? values
  }) {

    return MatrixDropDown(
      name: name ?? this.name,
      label: label ?? this.label,
      value: value ?? this.value,
      values: values ?? this.values,

    );

  }

}
