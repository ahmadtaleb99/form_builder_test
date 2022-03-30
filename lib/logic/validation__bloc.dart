// ignore_for_file: unnecessary_import

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_test/FormService/FormRepository.dart';
import 'package:form_builder_test/Widgets/DrawChecboxGroup.dart';
import 'package:form_builder_test/Widgets/DrawCheckboxGroupItem.dart';
import 'package:form_builder_test/Widgets/DrawChildList.dart';
import 'package:form_builder_test/Widgets/DrawDropDownButton.dart';
import 'package:form_builder_test/Widgets/DrawMultiSelect.dart';
import 'package:form_builder_test/Widgets/DrawRadioGroup.dart';
import 'package:form_builder_test/dynamic%20form/DropDownItem.dart';
import 'package:form_builder_test/Widgets/IDrawable.dart';
import 'package:meta/meta.dart';

part 'validation__event.dart';
part 'validation__state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  FormRepository _formRepository;

  ValidationBloc(this._formRepository) : super(ValidationState(childsMap: {})) {
    on<CheckboxGroupValueChanged>(_onCheckboxGroupValueChanged);
    on<StateFormRequested>(_onStateFormRequested);
    on<ParentDropListChanged>(_onParentDropListChanged1);
    on<childDropDownChanged>(_onchildDropDownChanged);
    on<RadioGroupValueChanged>(_onRadioGroupValueChanged);
    on<MultiSelectItemRemoved>(_onMultiSelectItemRemoved);
  }

  Future<void> _onStateFormRequested(
      StateFormRequested event, Emitter<ValidationState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var formElements = await _formRepository.LoadFormElements(event.formId);
    Map<String, FormElement>? map = {};
    // for(var formElement in formElements) {
    //   if(formElement is DrawChildList || formElement is DrawMultiSelect  ){
    //   map[formElement.name] = formElement;
    //   }
    // }

    print(map.toString());
    emit(state.copyWith(status: Status.success, formElements: formElements,childsMap: map));
  }

  void _onCheckboxGroupValueChanged(
      CheckboxGroupValueChanged event, Emitter<ValidationState> emit) {
    var group = _formRepository.getCheckBoxGroup(event.groupName);
    if (event.newIsChecked == true)
      group.checksNumber++;
    else
      group.checksNumber--;

    var child = group.children.firstWhere((element) => element.value == event.id);
    child.isChecked = event.newIsChecked;
    emit(state.copyWith(drawCheckboxGroup: group));
  }



  void _onParentDropListChanged1(ParentDropListChanged event, Emitter<ValidationState> emit) {


    var childLists =
    _formRepository.getChildrenSelectsFor(event.drawDropDownButton.name);
    print(childLists.toString()+ ' children for ${event.parent}');
    event.drawDropDownButton.value = event.parent;

    var map = state.childsMap;
    for (var childList in childLists) {
      var ch;
      if(childList is DrawChildList)
       ch = childList.copyWith();

     else if(childList is DrawMultiSelect)
         ch = childList.copyWith();


      ch.items =  ch.items.where((element) => element.parent == event.parent).toList();
      print(ch.items! );
      map[ch.name] = ch;
    }

    print(map.toString()+ '  chil   ');

    emit(state.copyWith( childsMap: map));



  }

  void _onchildDropDownChanged(
      childDropDownChanged event, Emitter<ValidationState> emit) {



    var map = state.childsMap;
    var ch = map[event.childList.name];
    if (ch is DrawChildList){
      ch.value = event.value;
    }

    else  if (ch is DrawMultiSelect){
      var list  = event.childList as DrawMultiSelect;
      ch.selectedValues = list.selectedValues;
    }
    map[ch!.name] = ch;



    emit(state.copyWith(childsMap: map));
  }

  void _onRadioGroupValueChanged(
      RadioGroupValueChanged event, Emitter<ValidationState> emit) {
    var radioGroup = _formRepository.getRadioGroup(event.groupName);
    var child =
        radioGroup.children.firstWhere((element) => element.value == event.id);
    for (var child in radioGroup.children) {
      child.groupValue = event.value;
    }
    radioGroup.value = event.value;
    if(event.value == 'other'){
      radioGroup.isOtherSelected= true;
  }
    else  radioGroup.isOtherSelected= false;

    var formElements =  _checkRelatedFields(event.value);
    emit(state.copyWith(formElements: formElements,status: Status.success));
  }

  List<FormElement>?  _checkRelatedFields(String value) {
    var formElements = _formRepository.formElementList as List<FormElement>;
    for (var formElement in formElements) {
      if (formElement.showIfValueSelected! &&
          formElement.showIfFieldValue == value)
        formElement.visible = true;
      else
        formElement.visible = false;
    }
  }







  void _onMultiSelectItemRemoved(MultiSelectItemRemoved event, Emitter<ValidationState> emit) {

    var map = state.childsMap;
    var select =  event.select;
      select.selectedValues.remove(event.item);
      map[select.name] = select;
      emit(state.copyWith(childsMap: map));
  }
}












