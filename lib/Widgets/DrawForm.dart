import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_test/Widgets/IDrawable.dart';
import 'package:form_builder_test/logic/validation__bloc.dart';

class DrawForm extends FormElement{


  final String label;
  final String name;
  final List<FormElement> fields;

  DrawForm({
    required this.label,
    required this.name,
    required this.fields,
  }) : super(label: label, name: name) ;


  GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: BlocBuilder<ValidationBloc, ValidationState>(
        builder: (context, state) {

          if (state.status == Status.loading)
            return CircularProgressIndicator();
          else if (state.status == Status.success) {
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: this.fields,
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }


}