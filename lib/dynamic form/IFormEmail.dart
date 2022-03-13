import 'package:flutter/src/widgets/framework.dart';
import 'package:form_builder_test/Widgets/DrawEmailTextField.dart';
import 'package:form_builder_test/dynamic%20form/formable.dart';

class IFormEmail implements IForm{
  dynamic _parameters;






  @override
  Widget drawFormElement({parameters}) {
    return DrawEmailTextField(label: _parameters['label'], required: _parameters['required']);
  }

  @override
  void setParameters(parametrs) {
    _parameters = parametrs;

  }

}