import 'package:form_builder_test/Widgets/IDrawable.dart';
import 'package:form_builder_test/dynamic%20form/IFormModel.dart';
import 'package:hive/hive.dart';

part 'CheckboxItem.g.dart';

@HiveType(typeId: 20)
class CheckboxItem implements IFormModel{

  @HiveField(1)
  String label;
  @HiveField(2)
  String groupName;
  @HiveField(3)
  String value;
  CheckboxItem({
    required this.label,
    required this.groupName,
    required this.value,
  });

  factory CheckboxItem.FromJson(parameters,String groupName) {
    return CheckboxItem(

      label: parameters['label'],
      groupName: groupName,
      value:parameters['value'],
    );
  }
  @override
  Map<String, dynamic> fomrElementtoJson(FormElement formElement) {
    return {};
  }

  @override
  FormElement toWidget() {
    throw UnimplementedError();
  }


}