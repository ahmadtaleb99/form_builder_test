import 'package:flutter/src/widgets/framework.dart';
import 'package:form_builder_test/Widgets/text_field_widget.dart';
import 'package:form_builder_test/Widgets/form_element_widget.dart';
import 'package:form_builder_test/Widgets/star_rating_widget.dart';
import 'package:form_builder_test/model/IFormModel.dart';
import 'package:hive/hive.dart';

part 'StarRating.g.dart';


@HiveType(typeId: 51)
class StarRating implements IFormModel {
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
  dynamic value;



  StarRating({
    required this.label,
    required this.name,
    required this.deactivate,
    required this.isHidden,
    required this.required,
    required this.isReadOnly,
    this.visible,
    this.value,
    required this.showIfValueSelected,
    this.showIfFieldValue,
    this.showIfIsRequired,
  });

  factory StarRating.fromJson(json) {
    return StarRating(
      label: json['label'],
      required: json['required'],
      showIfIsRequired: json['showIfIsRequired'],
      showIfFieldValue: json['showIfFieldValue'],
      isHidden: json['isHidden'],
      isReadOnly: json['isReadOnly'],
      showIfValueSelected: json['showIfLogicCheckbox'],
      name: json['name'],
      deactivate: json['deactivate'], );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StarRating &&
              runtimeType == other.runtimeType &&
              label == other.label &&
              name == other.name &&
              deactivate == other.deactivate &&
              isHidden == other.isHidden &&
              required == other.required &&
              isReadOnly == other.isReadOnly &&
              visible == other.visible &&
              showIfValueSelected == other.showIfValueSelected &&
              showIfFieldValue == other.showIfFieldValue &&
              showIfIsRequired == other.showIfIsRequired &&
              value == other.value;

  @override
  int get hashCode =>
      label.hashCode ^
      name.hashCode ^
      deactivate.hashCode ^
      isHidden.hashCode ^
      required.hashCode ^
      isReadOnly.hashCode ^
      visible.hashCode ^
      showIfValueSelected.hashCode ^
      showIfFieldValue.hashCode ^
      showIfIsRequired.hashCode ^
      value.hashCode;

  @override
  FormElementWidget toWidget() {
    return StarRatingWidget(
          label: this.label,
          value: this.value,
          required: this.required,
          showIfValueSelected: this.showIfValueSelected,
          showIfFieldValue: this.showIfFieldValue,
          showIfIsRequired: this.showIfIsRequired,
          name: this.name,
          visible: this.showIfValueSelected == true && value == null ? false : true,

    );
  }




  StarRating copyWith({
    dynamic? parameters,
    String? label,
    String? name,
    bool? deactivate,
    bool? isHidden,
    bool? required,
    bool? isReadOnly,
    bool? visible,
    bool? showIfValueSelected,
    String? showIfFieldValue,
    bool? showIfIsRequired,
    dynamic? value,
  }) {
    return StarRating(
      label: label ?? this.label,
      name: name ?? this.name,
      deactivate: deactivate ?? this.deactivate,
      isHidden: isHidden ?? this.isHidden,
      required: required ?? this.required,
      isReadOnly: isReadOnly ?? this.isReadOnly,
      visible: visible ?? this.visible,
      showIfValueSelected: showIfValueSelected ?? this.showIfValueSelected,
      showIfFieldValue: showIfFieldValue ?? this.showIfFieldValue,
      showIfIsRequired: showIfIsRequired ?? this.showIfIsRequired,
      value: value ?? this.value,
    );
  }

  @override
  String valueToString() {
    return this.value.toString();
  }
  @override
  bool isValid() {
    // TODO: implement isValid
    throw UnimplementedError();
  }
}
