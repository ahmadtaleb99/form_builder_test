
import 'package:flutter/cupertino.dart';
import 'package:form_builder_test/model/DropDownItem.dart';

abstract class FormElementWidget extends StatelessWidget {

  final String label;
  final String name;
  final bool? required;
  bool ? visible;
  final bool ? showIfValueSelected;
  final String ? showIfFieldValue;
  final bool ? showIfIsRequired;
  dynamic value;
  String? valueToString();


   FormElementWidget({
  Key? key,
    required this.label,
    required this.name,
     this.visible,
     this.required,
     this.showIfValueSelected,
     this.showIfFieldValue,
     this.showIfIsRequired,
  }) : super(key: key) ;





}

