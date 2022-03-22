import 'package:flutter/src/widgets/framework.dart';
import 'package:form_builder_test/Widgets/DrawRadioGroup.dart';
import 'package:form_builder_test/Widgets/DrawRadioItem.dart';

import 'formable.dart';

class IFormDrawRadioGroup implements IForm{

  dynamic _parameters;

  @override
  Widget drawFormElement() {
    List<DrawRadioItem> children = [];
    for (var radio in _parameters['values']){
      var newRadio = DrawRadioItem(label: radio['label'], value: radio['value'], parent:_parameters['name'],);
      children.add(newRadio);

    }
    return DrawRadioGroup(label: _parameters['label'], name: _parameters['name'],
        value: ' ', required: _parameters['required'], other: _parameters['other'],
        showIfValueSelected: false,
        children: children);
  }

  @override
  void setParameters(parametrs) {
    _parameters = parametrs;

  }


}