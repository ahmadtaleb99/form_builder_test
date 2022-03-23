import 'package:flutter/src/widgets/framework.dart';
import 'package:form_builder_test/Widgets/DrawTextArea.dart';
import 'package:form_builder_test/Widgets/IDrawable.dart';
import 'package:form_builder_test/dynamic%20form/formable.dart';

class IFormTextArea implements IForm {
  dynamic _parameters;

  @override
  IDrawable drawFormElement({parameters}) {
    return DrawTextArea(
      minLength: _parameters['minlength'],
      maxLength: _parameters['maxlength'],
      label: _parameters['label'],
      required: _parameters['required'],
      showIfIsRequired: _parameters['showIfIsRequired'],
      showIfFieldValue: _parameters['showIfFieldValue'],
      showIfValueSelected: _parameters['showIfLogicCheckbox'], name: _parameters['name'],  );
  }

  @override
  void setParameters(parametrs) {
    _parameters = parametrs;
  }
}
