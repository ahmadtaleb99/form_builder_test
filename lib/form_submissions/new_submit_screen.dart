import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_test/Widgets/Matrix/matrix_widget.dart';
import 'package:form_builder_test/utils/loading_overlay.dart';
import 'package:cool_alert/cool_alert.dart';

import '../data/FormRepository.dart';
import '../Widgets/form_widget.dart';
import '../validation/bloc/validation__bloc.dart';

class NewSubmitScreen extends StatelessWidget {
  FormWidget form;

  NewSubmitScreen({Key? key, required this.form}) : super(key: key);
  late GlobalKey<FormState> _key;
  var _loadingOverlay = LoadingService.instance;

  bool _formHasValues() {
    for (var field in form.fields) {
      if (field.value is List && (field.value.isNotEmpty)) return true;

      if (field is MatrixWidget && (field.list.isNotEmpty))
        return true;
      else if (!(field.value is List) && field.value != null) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? result;
        if (_formHasValues())
          result = await CoolAlert.show(
              context: context,
              showCancelBtn: true,
              title: 'Warning!',
              type: CoolAlertType.warning,
              text:
              "Some fields have values, if you go back values will be erased",
              onConfirmBtnTap: () {
                Navigator.pop(context, true);
              },
              onCancelBtnTap: () {
                Navigator.pop(context, false);
              },
              confirmBtnText: 'Exit anyway',
              cancelBtnText: 'Back');
        return result ?? true;
      },
      child: BlocBuilder<ValidationBloc, ValidationState>(
        builder: (context, state) {
          return Scaffold(
              floatingActionButton: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    if (form.validate()) {
                      form.save();

                      context
                          .read<ValidationBloc>()
                          .add(FormSubmitted(formName: this.form.name));
                    }
                  },
                  child: Text('submit form ')),
              appBar: AppBar(
                actions: [
                  NodeWidget()
                ],
                title: Text('New Form Submission'),
                centerTitle: true,
              ),
              body: Center(
                child: BlocConsumer<ValidationBloc, ValidationState>(
                  listener: (context, state) {
                    if (state.status == Status.loading)
                      _loadingOverlay.show(context, msg: 'submitting ...');
                    else
                      _loadingOverlay.hide();

                    if (state.submitted!  ) {
                      if(state.status == Status.success){
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: "Form is Submitted successfuly!",
                            onConfirmBtnTap: () {
                              Navigator.pop(context);
                            });
                      }

                      else if(state.status == Status.failure){
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text: state.errorMsg,
                            onConfirmBtnTap: () {
                              Navigator.pop(context);
                            });
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state.status == Status.success) {
                      form = state.form!;
                      return state.form!;
                    } else
                      return Container();
                  },
                ),
              ));
        },
      ),
    );
  }
}


class NodeWidget extends StatelessWidget {
  const NodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationBloc, ValidationState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left:10,right: 10  ),
          child: DropdownButton<String>(
            value: state.currentNode != null ? state.currentNode!.id : null,
            items: state.nodes
                .map((e) =>
                DropdownMenuItem<String>(child: Text(e.name,style:TextStyle(fontSize: 15,fontStyle: FontStyle.italic)), value: e.id,))
                .toList(),

            onChanged: (value) {
              print(value);
              context.read<ValidationBloc>().add(NodeChanged(
                  state.nodes.firstWhere((node) => value == node.id)));
            },
            icon: Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(

                    'assets/node.png',
                      height: 18,
                  ),
                  Text('Node',style: TextStyle(fontSize: 13,fontStyle: FontStyle.italic),)
                ],
              ),
            ),
          ),
        );
      },
    )
    ;
  }
}
