import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_builder_test/Widgets/DrawDropDownButton.dart';
import 'package:form_builder_test/dynamic%20form/IFormTextField.dart';
import 'package:path_provider/path_provider.dart';

import 'dynamic form/IFormDropList.dart';



    String formsJson =r'[{"name":"First Form","directionality":"ltr","fields":[{"type":"text","label":"Full name","deactivate":false,"required":true,"isHidden":false,"unique":true,"isReadOnly":false,"className":"form-control","name":"text-1646834996026","showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false},{"type":"select","label":"Country","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835011249","prompt":"Select a value","relatedListCheckbox":false,"multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Syria","value":"Syria","parent":"","status":"Active","score":"0"},{"label":"Jordan","value":"Jordan","parent":"","status":"Active","score":"0"}]},{"type":"select","label":"Country","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-america","prompt":"Select a value","relatedListCheckbox":false,"multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Uk","value":"America","parent":"","status":"Active","score":"0"},{"label":"Germany","value":"Germany","parent":"","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835142695","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Damascus","value":"Damascus","parent":"Syria","status":"Active","score":"0"},{"label":"Homs","value":"Homs","parent":"Syria","status":"Active","score":"0"},{"label":"Aleppo","value":"Aleppo","parent":"Syria","status":"Active","score":"0"},{"label":"Erbid","value":"Erbid","parent":"Jordan","status":"Active","score":"0"},{"label":"Amman","value":"Amman","parent":"Jordan","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-164683514269a5","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Tartous","value":"Tartous","parent":"Syria","status":"Active","score":"0"},{"label":"Lattakia","value":"Lattakia","parent":"Syria","status":"Active","score":"0"},{"label":"Idleb","value":"Idleb","parent":"Syria","status":"Active","score":"0"},{"label":"batra","value":"batra","parent":"Jordan","status":"Active","score":"0"},{"label":"rom","value":"rom","parent":"Jordan","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-164683514w","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-america","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Detroit","value":"Detroit","parent":"America","status":"Active","score":"0"},{"label":"New York","value":"New York","parent":"America","status":"Active","score":"0"},{"label":"California","value":"California","parent":"America","status":"Active","score":"0"},{"label":"berlin","value":"berlin","parent":"Germany","status":"Active","score":"0"},{"label":"Wupportal","value":"Wupportal","parent":"Germany","status":"Active","score":"0"}]},{"type":"email","label":"Email","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"name":"email-1646835207080","showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false},{"type":"textarea","label":"Description","deactivate":false,"required":false,"isHidden":true,"isReadOnly":false,"className":"form-control","name":"textarea-1646835223783","showIfLogicCheckbox":true,"showIfFieldName":"frmb-1646834975594-fld-3","showIfFieldValue":"Syria","showIfIsRequired":false,"requiredIfLogicCheckbox":false,"minlength":5,"maxlength":1000,"textareaType":"normal"},{"type":"number","label":"Salary","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"number-1646835311382","showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"expressionsCheckbox":true,"operator":"more","expressionsValue":50},{"type":"checkbox-group","label":"Hobbies","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"toggle":false,"inline":false,"name":"checkbox-group-first","other":false,"minMaxCheckbox":true,"checkboxMinValue":1,"checkboxMaxValue":2,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Swimming","value":"Swimming","parent":"","status":"Active","score":"0"},{"label":"Reading","value":"Reading","parent":null,"status":"Active","score":"0"},{"label":"Movies","value":"Movies","parent":null,"status":"Active","score":"0"}]},{"type":"checkbox-group","label":"Sport","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"toggle":false,"inline":false,"name":"checkbox-group-third","other":false,"minMaxCheckbox":true,"checkboxMinValue":1,"checkboxMaxValue":2,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Football","value":"Football","parent":"","status":"Active","score":"0"},{"label":"Basketball","value":"Basketball","parent":null,"status":"Active","score":"0"},{"label":"Vollyball","value":"Vollyball","parent":null,"status":"Active","score":"0"}]},{"type":"checkbox-group","label":"Food","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"toggle":false,"inline":false,"name":"checkbox-group-second","other":false,"minMaxCheckbox":true,"checkboxMinValue":0,"checkboxMaxValue":1,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Pasta","value":"Pasta","parent":"","status":"Active","score":"0"},{"label":"Pizza","value":"Pizza","parent":null,"status":"Active","score":"0"},{"label":"Rice","value":"Rice","parent":null,"status":"Active","score":"0"}]}]},{"name":"Second Form","directionality":"ltr","fields":[{"type":"radio-group","label":"Gender","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"inline":false,"name":"radio-group-1","other":true,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Male","value":"Male","parent":"","status":"Active","score":"0"},{"label":"Female","value":"Female","parent":"","status":"Active","score":"0"}]},{"type":"text","label":"Military Service","deactivate":false,"required":false,"isHidden":true,"unique":false,"isReadOnly":false,"className":"form-control","name":"text-1647860866724","showIfLogicCheckbox":true,"showIfFieldName":"radio-group-1647860832245","showIfFieldValue":"Male","showIfIsRequired":true,"requiredIfLogicCheckbox":false},{"type":"select","label":"Country","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835011249","prompt":"Select a value","relatedListCheckbox":false,"multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Syria","value":"Syria","parent":"","status":"Active","score":"0"},{"label":"Jordan","value":"Jordan","parent":"","status":"Active","score":"0"}]},{"type":"text","label":"Military Service","deactivate":false,"required":false,"isHidden":true,"unique":false,"isReadOnly":false,"className":"form-control","name":"text-1647860866s724","showIfLogicCheckbox":true,"showIfFieldName":"radio-group-1647860832245","showIfFieldValue":"Male","showIfIsRequired":true,"requiredIfLogicCheckbox":false},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835142695","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":true,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Damascus","value":"Damascus","parent":"Syria","status":"Active","score":"0"},{"label":"Homs","value":"Homs","parent":"Syria","status":"Active","score":"0"},{"label":"Aleppo","value":"Aleppo","parent":"Syria","status":"Active","score":"0"},{"label":"Erbid","value":"Erbid","parent":"Jordan","status":"Active","score":"0"},{"label":"Amman","value":"Amman","parent":"Jordan","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835ss142695","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Damasscus","value":"Damasscus","parent":"Syria","status":"Active","score":"0"},{"label":"Hsoms","value":"Hsoms","parent":"Syria","status":"Active","score":"0"},{"label":"Asleppo","value":"Asleppo","parent":"Syria","status":"Active","score":"0"},{"label":"Esrbid","value":"Esrbid","parent":"Jordan","status":"Active","score":"0"},{"label":"sAmman","value":"sAmman","parent":"Jordan","status":"Active","score":"0"}]},{"type":"select","label":"Tags","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1647860928364","prompt":"Select a value","relatedListCheckbox":false,"multiple":true,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Food","value":"Food","parent":"","status":"Active","score":"0"},{"label":"Sport","value":"Sport","parent":"","status":"Active","score":"0"},{"label":"Gaming","value":"Gaming","parent":null,"status":"Active","score":"0"},{"label":"Movies","value":"Movies","parent":null,"status":"Active","score":"0"},{"label":"Reading","value":"Reading","parent":null,"status":"Active","score":"0"},{"label":"Anime","value":"Anime","parent":null,"status":"Active","score":"0"},{"label":"Eating","value":"Eating","parent":null,"status":"Active","score":"0"},{"label":"Politics","value":"Politics","parent":null,"status":"Active","score":"0"}]},{"type":"file","label":"Personal Photo","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"file-1647861000731","showIfLogicCheckbox":true,"showIfFieldName":"radio-group-1647860832245","showIfFieldValue":"Male","showIfIsRequired":false,"requiredIfLogicCheckbox":false,"maxFileSize":2,"fileType":"Image"}]},{"name":"Third Form","directionality":"ltr","fields":[{"type":"text","label":"Military Service","deactivate":false,"required":false,"isHidden":true,"unique":false,"isReadOnly":false,"className":"form-control","name":"text-1647860866724","showIfLogicCheckbox":false,"showIfFieldName":"radio-group-1647860832245","showIfFieldValue":"Male","showIfIsRequired":true,"requiredIfLogicCheckbox":false},{"type":"file","label":"Personal Photo","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"file-1647861000731","showIfLogicCheckbox":false,"showIfFieldName":"radio-group-1647860832245","showIfFieldValue":"Male","showIfIsRequired":false,"requiredIfLogicCheckbox":false,"maxFileSize":2,"fileType":"Image"}]},{"name":"fourthForm","directionality":"ltr","fields":[{"type":"select","label":"Country","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-16468s35011249","prompt":"Select a value","relatedListCheckbox":false,"multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Syria","value":"Syria","parent":"","status":"Active","score":"0"},{"label":"Jordan","value":"Jordan","parent":"","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-16468a35142695","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-16468s35011249","multiple":true,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Damascus","value":"Damascus","parent":"Syria","status":"Active","score":"0"},{"label":"Homs","value":"Homs","parent":"Syria","status":"Active","score":"0"},{"label":"Aleppo","value":"Aleppo","parent":"Syria","status":"Active","score":"0"},{"label":"Erbid","value":"Erbid","parent":"Jordan","status":"Active","score":"0"},{"label":"Amman","value":"Amman","parent":"Jordan","status":"Active","score":"0"}]}]},{"name":"fifth Form","directionality":"ltr","fields":[{"type":"file","label":"Personal Photo","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"file-16478sd61000731","showIfLogicCheckbox":false,"showIfFieldName":"radio-group-1647860832245","showIfFieldValue":"Male","showIfIsRequired":false,"requiredIfLogicCheckbox":false,"maxFileSize":500,"fileType":"Image"}]}]';
    String rawJson = r'[{"type":"text","label":"Full name","deactivate":false,"required":true,"isHidden":false,"unique":true,"isReadOnly":false,"className":"form-control","name":"text-1646834996026","showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false},{"type":"select","label":"Country","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835011249","prompt":"Select a value","relatedListCheckbox":false,"multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Syria","value":"Syria","parent":"","status":"Active","score":"0"},{"label":"Jordan","value":"Jordan","parent":"","status":"Active","score":"0"}]},{"type":"select","label":"Country","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-america","prompt":"Select a value","relatedListCheckbox":false,"multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Uk","value":"America","parent":"","status":"Active","score":"0"},{"label":"Germany","value":"Germany","parent":"","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835142695","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Damascus","value":"Damascus","parent":"Syria","status":"Active","score":"0"},{"label":"Homs","value":"Homs","parent":"Syria","status":"Active","score":"0"},{"label":"Aleppo","value":"Aleppo","parent":"Syria","status":"Active","score":"0"},{"label":"Erbid","value":"Erbid","parent":"Jordan","status":"Active","score":"0"},{"label":"Amman","value":"Amman","parent":"Jordan","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-164683514269a5","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Tartous","value":"Tartous","parent":"Syria","status":"Active","score":"0"},{"label":"Lattakia","value":"Lattakia","parent":"Syria","status":"Active","score":"0"},{"label":"Idleb","value":"Idleb","parent":"Syria","status":"Active","score":"0"},{"label":"batra","value":"batra","parent":"Jordan","status":"Active","score":"0"},{"label":"rom","value":"rom","parent":"Jordan","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-164683514w","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-america","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Detroit","value":"Detroit","parent":"America","status":"Active","score":"0"},{"label":"New York","value":"New York","parent":"America","status":"Active","score":"0"},{"label":"California","value":"California","parent":"America","status":"Active","score":"0"},{"label":"berlin","value":"berlin","parent":"Germany","status":"Active","score":"0"},{"label":"Wupportal","value":"Wupportal","parent":"Germany","status":"Active","score":"0"}]},{"type":"email","label":"Email","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"name":"email-1646835207080","showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false},{"type":"textarea","label":"Description","deactivate":false,"required":false,"isHidden":true,"isReadOnly":false,"className":"form-control","name":"textarea-1646835223783","showIfLogicCheckbox":true,"showIfFieldName":"frmb-1646834975594-fld-3","showIfFieldValue":"Syria","showIfIsRequired":false,"requiredIfLogicCheckbox":false,"minlength":5,"maxlength":1000,"textareaType":"normal"},{"type":"number","label":"Salary","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"number-1646835311382","showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"expressionsCheckbox":true,"operator":"more","expressionsValue":50},{"type":"checkbox-group","label":"Hobbies","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"toggle":false,"inline":false,"name":"checkbox-group-first","other":false,"minMaxCheckbox":true,"checkboxMinValue":1,"checkboxMaxValue":2,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Swimming","value":"Swimming","parent":"","status":"Active","score":"0"},{"label":"Reading","value":"Reading","parent":null,"status":"Active","score":"0"},{"label":"Movies","value":"Movies","parent":null,"status":"Active","score":"0"}]},{"type":"checkbox-group","label":"Sport","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"toggle":false,"inline":false,"name":"checkbox-group-third","other":false,"minMaxCheckbox":true,"checkboxMinValue":1,"checkboxMaxValue":2,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Football","value":"Football","parent":"","status":"Active","score":"0"},{"label":"Basketball","value":"Basketball","parent":null,"status":"Active","score":"0"},{"label":"Vollyball","value":"Vollyball","parent":null,"status":"Active","score":"0"}]},{"type":"checkbox-group","label":"Food","deactivate":false,"required":false,"isHidden":false,"isReadOnly":false,"toggle":false,"inline":false,"name":"checkbox-group-second","other":false,"minMaxCheckbox":true,"checkboxMinValue":0,"checkboxMaxValue":1,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Pasta","value":"Pasta","parent":"","status":"Active","score":"0"},{"label":"Pizza","value":"Pizza","parent":null,"status":"Active","score":"0"},{"label":"Rice","value":"Rice","parent":null,"status":"Active","score":"0"}]}]';
String rawJson1 = r'[{"type":"radio-group","label":"Gender","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"inline":false,"name":"radio-group-1","other":true,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Male","value":"Male","parent":"","status":"Active","score":"0"},{"label":"Female","value":"Female","parent":"","status":"Active","score":"0"}]},{"type":"text","label":"Military Service","deactivate":false,"required":false,"isHidden":true,"unique":false,"isReadOnly":false,"className":"form-control","name":"text-1647860866724","showIfLogicCheckbox":true,"showIfFieldName":"radio-group-1647860832245","showIfFieldValue":"Male","showIfIsRequired":true,"requiredIfLogicCheckbox":false},{"type":"select","label":"Country","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835011249","prompt":"Select a value","relatedListCheckbox":false,"multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Syria","value":"Syria","parent":"","status":"Active","score":"0"},{"label":"Jordan","value":"Jordan","parent":"","status":"Active","score":"0"}]},{"type":"text","label":"Military Service","deactivate":false,"required":false,"isHidden":true,"unique":false,"isReadOnly":false,"className":"form-control","name":"text-1647860866s724","showIfLogicCheckbox":true,"showIfFieldName":"radio-group-1647860832245","showIfFieldValue":"Male","showIfIsRequired":true,"requiredIfLogicCheckbox":false},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835142695","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":true,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Damascus","value":"Damascus","parent":"Syria","status":"Active","score":"0"},{"label":"Homs","value":"Homs","parent":"Syria","status":"Active","score":"0"},{"label":"Aleppo","value":"Aleppo","parent":"Syria","status":"Active","score":"0"},{"label":"Erbid","value":"Erbid","parent":"Jordan","status":"Active","score":"0"},{"label":"Amman","value":"Amman","parent":"Jordan","status":"Active","score":"0"}]},{"type":"select","label":"City","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1646835ss142695","prompt":"Select a value","relatedListCheckbox":true,"relatedListFieldName":"select-1646835011249","multiple":false,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Damasscus","value":"Damasscus","parent":"Syria","status":"Active","score":"0"},{"label":"Hsoms","value":"Hsoms","parent":"Syria","status":"Active","score":"0"},{"label":"Asleppo","value":"Asleppo","parent":"Syria","status":"Active","score":"0"},{"label":"Esrbid","value":"Esrbid","parent":"Jordan","status":"Active","score":"0"},{"label":"sAmman","value":"sAmman","parent":"Jordan","status":"Active","score":"0"}]},{"type":"select","label":"Tags","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"select-1647860928364","prompt":"Select a value","relatedListCheckbox":false,"multiple":true,"scoring":false,"other":false,"showIfLogicCheckbox":false,"showIfIsRequired":false,"requiredIfLogicCheckbox":false,"values":[{"label":"Food","value":"Food","parent":"","status":"Active","score":"0"},{"label":"Sport","value":"Sport","parent":"","status":"Active","score":"0"},{"label":"Gaming","value":"Gaming","parent":null,"status":"Active","score":"0"},{"label":"Movies","value":"Movies","parent":null,"status":"Active","score":"0"},{"label":"Reading","value":"Reading","parent":null,"status":"Active","score":"0"},{"label":"Anime","value":"Anime","parent":null,"status":"Active","score":"0"},{"label":"Eating","value":"Eating","parent":null,"status":"Active","score":"0"},{"label":"Politics","value":"Politics","parent":null,"status":"Active","score":"0"}]},{"type":"file","label":"Personal Photo","deactivate":false,"required":true,"isHidden":false,"isReadOnly":false,"className":"form-control","name":"file-1647861000731","showIfLogicCheckbox":true,"showIfFieldName":"radio-group-1647860832245","showIfFieldValue":"Male","showIfIsRequired":false,"requiredIfLogicCheckbox":false,"maxFileSize":2,"fileType":"Image"}]';

class drawer {
  List<dynamic> parameters;
  Function drawFunction;

  drawer({required this.parameters, required this.drawFunction});


}


 Future<String>  getBase() async {
  var  appDirectory = await getApplicationDocumentsDirectory();
    return appDirectory.path+'/filePickerCache';
 }
