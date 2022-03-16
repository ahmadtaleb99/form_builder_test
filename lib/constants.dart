import 'package:flutter/material.dart';
import 'package:form_builder_test/Widgets/DrawDropDownButton.dart';
import 'package:form_builder_test/dynamic%20form/IFormTextField.dart';

import 'dynamic form/IFormDropList.dart';

var htmlFormToFlutter =  {
  'select' :  IFormDropList(),
    'text' :  IFormTextField()
};



String rawJson = r'[{"type":"text","label":"Fullname","deactivate":false,"required":true,"isHidden":false,"unique":true,"isReadOnly":false,"className":"form-control","name":"text-1646834996026","showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false},{"type":"select","label":"Country","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835011249","prompt":"Select a value","relatedListCheckbox":false,"multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Syria","value":"Syria","parent":"","status":"Active","score":"0"},{"label":"Jordan","value":"Jordan","parent":"","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835142695","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Damascus","value":"Damascus","parent":"Syria","status":"Active","score":"0"},{"label":"Homs","value":"Homs","parent":"Syria","status":"Active","score":"0"},{"label":"Aleppo","value":"Aleppo","parent":"Syria","status":"Active","score":"0"},{"label":"Erbid","value":"Erbid","parent":"Jordan","status":"Active","score":"0"},{"label":"Amman","value":"Amman","parent":"Jordan","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-164683514269a5","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Tartous","value":"Tartous","parent":"Syria","status":"Active","score":"0"},{"label":"Lattakia","value":"Lattakia","parent":"Syria","status":"Active","score":"0"},{"label":"Idleb","value":"Idleb","parent":"Syria","status":"Active","score":"0"},{"label":"batra","value":"batra","parent":"Jordan","status":"Active","score":"0"},{"label":"rom","value":"rom","parent":"Jordan","status":"Active","score":"0"}]},{"type":"email","label":"Email","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"name":"email-1646835207080","showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false},{"type":"textarea","label":"Description","deactivate":false,"required":false,"isHidden":true,"isReadOnly":false,"className":"form-control","name":"textarea-1646835223783","showIfLogicCheckbox":true,"showIfFieldName":"frmb-1646834975594-fld-3","showIfFieldValue":"Syria","showIfIsRequired":false,"requiredIfLogicCheckbox":false,"minlength":5,"maxlength":1000,"textareaType":"normal"},{"type":"number","label":"Salary","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"number-1646835311382","showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"expressionsCheckbox":true,"operator":"more","expressionsValue":50},{"type":"checkbox-group","label":"Hobbies","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"toggle":false,"inline":false,"name":"checkbox-group-first","other":false,"minMaxCheckbox":true,"checkboxMinValue":1,"checkboxMaxValue":2,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Swimming","value":"Swimming","parent":"","status":"Active","score":"0"},{"label":"Reading","value":"Reading","parent":null,"status":"Active","score":"0"},{"label":"Movies","value":"Movies","parent":null,"status":"Active","score":"0"}]},{"type":"checkbox-group","label":"Hobbies","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"toggle":false,"inline":false,"name":"checkbox-group-third","other":false,"minMaxCheckbox":true,"checkboxMinValue":1,"checkboxMaxValue":2,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"asd","value":"Swimmasding","parent":"","status":"Active","score":"0"},{"label":"asd","value":"sad","parent":null,"status":"Active","score":"0"},{"label":"Movies","value":"Movies","parent":null,"status":"Active","score":"0"}]},{"type":"checkbox-group","label":"Hobbies","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"toggle":false,"inline":false,"name":"checkbox-group-second","other":false,"minMaxCheckbox":true,"checkboxMinValue":0,"checkboxMaxValue":1,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Swimming","value":"Swimming","parent":"","status":"Active","score":"0"},{"label":"loling","value":"Reading","parent":null,"status":"Active","score":"0"},{"label":"Movies","value":"Movies","parent":null,"status":"Active","score":"0"}]}]';
String rawJson2 = r'[{"type":"select","label":"countries","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646638397919","prompt":"Select a value","relatedListCheckbox":false,"multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"syr","value":"syr","parent":"","status":"Active","score":"0","selected":true},{"label":"joran","value":"joran","parent":"","status":"Active","score":"0"}]},{"type":"select","label":"cities","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646638398638","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"frmb-1646638394223-fld-1","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"dama","value":"dama","parent":"syr","status":"Active","score":"0","selected":true},{"label":"erbid","value":"erbid","parent":"joran","status":"Active","score":"0"}]}]';

class drawer {
  List<dynamic> parameters;
  Function drawFunction;

  drawer({required this.parameters, required this.drawFunction});


}