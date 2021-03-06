import 'package:equatable/equatable.dart';
import 'package:form_builder_test/Widgets/radio_item_widget.dart';
import 'package:form_builder_test/Widgets/form_element_widget.dart';
import 'package:form_builder_test/model/IFormModel.dart';
import 'package:hive/hive.dart';

part 'RadioItem.g.dart';


@HiveType(typeId: 56)
class RadioItem extends Equatable implements IFormModel  {

  @HiveField(1)
   String label;
  @HiveField(2)
  String parent;
  @HiveField(3)
  dynamic value;

  @override
  factory RadioItem.fromJson(parameters,String parent) {
    return RadioItem(

      label: parameters['label'],
      parent :parent,
      value: parameters['value']
    );
  }





   RadioItem({
    required this.label,
    required this.parent,
    required this.value,
  });

  @override
  Map<String, dynamic> fomrElementtoJson(FormElementWidget formElement) {
    // TODO: implement fomrElementtoJson
    throw UnimplementedError();
  }

  @override
  FormElementWidget toWidget() {
    return RadioItemWidget(
        label: this.label,
        parent :this.parent,
        value: this.value,
    );
  }

  RadioItem copyWith({
    String? label,
    String? parent,
    dynamic? value,
  }) {
    return RadioItem(
      label: label ?? this.label,
      parent: parent ?? this.parent,
      value: value ?? this.value,
    );
  }


  @override
  String valueToString() {
    return value.toString();
  }

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement props
  List<Object?> get props => [parent,label,value];

  @override
  bool isValid() {
    // TODO: implement isValid
    throw UnimplementedError();
  }



}
