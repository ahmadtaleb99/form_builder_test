import 'dart:developer';
import 'dart:ui';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:form_builder_test/Widgets/checkbox_group_widget.dart';
import 'package:form_builder_test/Widgets/child_dropdown_widget.dart';
import 'package:form_builder_test/Widgets/dropdown_widget.dart';
import 'package:form_builder_test/Widgets/multi_select_widget.dart';
import 'package:form_builder_test/Widgets/number_field_widget.dart';
import 'package:form_builder_test/Widgets/radio_group_widget.dart';
import 'package:form_builder_test/Widgets/form_element_widget.dart';
import 'package:form_builder_test/Widgets/star_rating_widget.dart';

import '../validation/bloc/validation__bloc.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_test/Widgets/file_picker_widget.dart';
import 'package:form_builder_test/Widgets/form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmittionsDetailsPage extends StatelessWidget {
  FormWidget formWidget;
  SubmittionsDetailsPage({Key? key, required this.formWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rows = _buildRows(formWidget);
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Details'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        itemCount: rows.length+1,
        itemBuilder: (context, index) {
          return index == 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: LabelWidget(),
                )
              :  rows[index-1];
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 2,
        ),
      ),
    );
  }
}

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('Field',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        Text('Value',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}

Widget _getFormElementThumbnail(FormElementWidget field) {
  if (field is CheckboxGroupWidget) {
    return FieldHintWidget(text: '(Checkbox Group)');
  }
  if (field is RadioGroupWidget) {
    return FieldHintWidget(text: '(Radio Group)');
  }
  if (field is MultiSelectWidget ||
      field is ChildDropDownWidget ||
      field is DropDownWidget) {
    return FieldHintWidget(text: '(Select)');
  }

  if (field is FilePickerWidget) {
    return Container();
  }
  if (field is StarRatingWidget) {
    return FieldHintWidget(text: '(Star Rating)');
  }
  if (field is NumberFieldWidget) {
    return FieldHintWidget(text: '(Number)');
  } else
    return FieldHintWidget(text: '(Text)');
}

class FieldHintWidget extends StatelessWidget {
  final String text;
  const FieldHintWidget({
    Key? key,
    required  this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Text(text, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlueAccent,fontStyle: FontStyle.italic));

  }
}

List<Widget> _buildRows(FormWidget formWidget) {
  List<Widget> rows = [];
  for (var field in formWidget.fields) {
    if (field.value != null) {
      log('value isnt null ${field.label} ${field.value} ');
      rows.add(

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: FieldWidget(field: field),flex: 3,),
                Expanded(child: ValueWidget(field: field),flex: 2,)
              ],
            ),
          ));
    }
    else       log('value is null ${field.label} ');

  }

  return rows;
}

class ValueWidget extends StatelessWidget {
  FormElementWidget field;

  @override
  Widget build(BuildContext context) {
    if ( field is FilePickerWidget){
      log('field is DrawFilePicker :::::::::::::::::::::::::::: ') ;
      return
        ElevatedButton(
            onPressed: () async {
              context
                  .read<ValidationBloc>()
                  .add(FilePreviewRequested(path: field.value));
            },
            child: Text('download file'));
    }
   if ( field is StarRatingWidget){
      log('field is DrawFilePicker :::::::::::::::::::::::::::: ') ;
      return
        RatingBarIndicator(
          rating: field.value,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 25.0,
          direction: Axis.horizontal,
        );
    }

    else {
      log('field isnt DrawFilePicker ') ;

      return Text(field.valueToString() ?? 'empty',
          overflow: TextOverflow.fade,
          softWrap: true,
          style: TextStyle(
              fontSize: 15,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold));
    };
  }

  ValueWidget({
    required this.field,
  });
}
class FieldWidget extends StatelessWidget {
  FormElementWidget field;

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        Text(field.label, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
    SizedBox(
    width: 5,
    ),
    _getFormElementThumbnail(field)
      ],
    );

  }

  FieldWidget({
    required this.field,
  });
}

