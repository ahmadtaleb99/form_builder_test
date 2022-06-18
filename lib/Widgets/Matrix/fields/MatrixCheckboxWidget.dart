import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_test/dynamic%20form/matrix/fields/MatrixCheckbox.dart';
import 'package:form_builder_test/logic/validation__bloc.dart';
import 'package:provider/src/provider.dart';
import '../../IDrawable.dart';

class MatrixCheckboxWidget extends FormElementWidget {
  final String label;
  final String name;
  dynamic value;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(value: value ?? false,title: Text(label),contentPadding: EdgeInsets.only(right:19), onChanged: (value){
      this.value = value;
      context.read<ValidationBloc>().add(Refresher());
    });
  }

   MatrixCheckboxWidget({
    required this.label,
    required this.name,
    required this.value
   }) : super(label: label,name: name);

  @override
  String ? valueToString() {
    // TODO: implement valueToString
    return this.value != null ? this.value.toString() : this.value;
  }




  MatrixCheckbox toModel(){
    return MatrixCheckbox(name: name, label: label,value:value);
  }
}