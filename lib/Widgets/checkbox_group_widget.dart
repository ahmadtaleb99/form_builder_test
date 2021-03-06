import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_test/Widgets/checkbox_group_item_widget.dart';
import 'package:form_builder_test/validation/bloc/validation__bloc.dart';

import 'form_element_widget.dart';

class CheckboxGroupWidget extends FormElementWidget {
  CheckboxGroupWidget( {
    Key? key,
    required this.children,
    required this.minMaxCheckbox,
    this.minCheckedAllowed,
    this.maxCheckedAllowed,
    this.validator,
    required this.label,
    this.visible,
    this.value,
    required this.required,
    required this.deactivate,
    required this.other,
    required this.name,
    required this.showIfValueSelected,
    required this.showIfFieldValue,
    required this.showIfIsRequired,
    required this.deactivated,
    required this.isHidden,
    required this.isReadOnly,
  }) : super(
            key: key,
            label: label,
            name: name,
            visible: visible,
            required: required,
            showIfValueSelected: showIfValueSelected,
            showIfFieldValue: showIfFieldValue,
            showIfIsRequired: showIfIsRequired);

  final List<CheckboxGroupItemWidget> children;
  dynamic value;
  final String label;
  final String name;
  final bool deactivated;
  final bool required;
  final bool isHidden;
  final bool deactivate;
  bool? visible;
  final bool isReadOnly;
  final bool? showIfIsRequired;
  final bool showIfValueSelected;
  final bool other;
  final String? showIfFieldValue;
  final bool minMaxCheckbox;
  final int? minCheckedAllowed;
  final int? maxCheckedAllowed;
  final String? Function(bool?)? validator;
  int checksNumber   = 0;


  @override
  Widget build(BuildContext context) {
    if(value != null )
      checksNumber = value.length;
    return Padding(
      padding: this.visible == true ?   const EdgeInsets.only(top: 36) :  const EdgeInsets.only(top: 0),
      child: FormField<bool>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (minMaxCheckbox == true) {
            if (checksNumber > maxCheckedAllowed! ||
                checksNumber < minCheckedAllowed!) {
              return 'you must choose at least  $minCheckedAllowed and no more than $maxCheckedAllowed';
            }
          } else
            return null;
        },
        builder: (FormFieldState<bool> fieldState) {
          return GestureDetector(
            onTap: () => fieldState.validate(),
            child: Column(
              children: [
                Text(label),
                SizedBox(
                  height: 10,
                ),
                BlocConsumer<ValidationBloc, ValidationState>(
                  buildWhen: (previous, current) {
                    if (previous != current &&
                       current.drawCheckboxGroup != null &&  current.drawCheckboxGroup!.name == this.name) {
                      fieldState.validate();
                      return true;
                    }
                    return false;
                  },
listener: (context, state) {},

    builder: (context, state) {


                    return GestureDetector(
                        onTap: () => fieldState.validate(),
                        child: Column(children: [
                      ...   this.children,

                        ]));
                  },
                ),
                if (fieldState.hasError)
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Text(
                      fieldState.errorText!,
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 13,
                          color: Colors.red[700],
                          height: 0.5),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  String valueToString() {
    List values= value as List;

    if(values.isEmpty) return 'Empty';
    return values.join(',').toString();

  }


}
