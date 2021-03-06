import 'package:equatable/equatable.dart';
import 'package:form_builder_test/Widgets/checkbox_group_item_widget.dart';
import 'package:form_builder_test/Widgets/form_element_widget.dart';
import 'package:form_builder_test/model/IFormModel.dart';
import 'package:hive/hive.dart';

part 'CheckboxItem.g.dart';

@HiveType(typeId: 40)
class CheckboxItem extends Equatable implements IFormModel{

  @HiveField(1)
  String label;
  @HiveField(2)
  String groupName;
  @HiveField(3)
  dynamic value;
  CheckboxItem({
    required this.label,
    required this.groupName,
    required this.value,
  })  ;



  factory CheckboxItem.FromJson(json,String groupName) {
    return CheckboxItem(
      label: json['label'],
      groupName: groupName,
      value:json['value'],
    );
  }


  @override
  FormElementWidget toWidget() {
    return CheckboxGroupItemWidget(label: label, value: value, groupName: groupName);
  }

  CheckboxItem copyWith({
    String? label,
    String? groupName,
    dynamic? value,
  }) {
    return CheckboxItem(
      label: label ?? this.label,
      groupName: groupName ?? this.groupName,
      value: value ?? this.value,
    );
  }


  @override
  String valueToString() {
    return this.value.toString();
  }

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement props
  List<Object?> get props => [groupName,label,value];

  @override
  bool isValid() {
    // TODO: implement isValid
    throw UnimplementedError();
  }
}