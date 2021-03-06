import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_test/data/FormRepository.dart';
import 'package:form_builder_test/form_submissions/submissionDetailsPage.dart';

import '../Widgets/Matrix/cubit/matrix_record_cubit.dart';
import '../Widgets/form_widget.dart';
import '../validation/bloc/validation__bloc.dart';
import 'UpdateFormPage.dart';

class SubmittionsPage extends StatelessWidget {
  FormWidget form;

  SubmittionsPage({Key? key, required this.form}) : super(key: key);
  late GlobalKey<FormState> _key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text(form.name+' submissions'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ValidationBloc, ValidationState>(
                builder: (context, state) {
                  if(state.subedForms!.isEmpty)
                    return Text('There are no submitted forms yet');
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.subedForms!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: SubmissionCard(
                              form: state.subedForms![index],
                              onUpdateCallBack: () {
                                context.read<ValidationBloc>()
                                    .add(FormUpdateRequested(formName: state.subedForms![index].name,index: index));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlocProvider(
  create: (context) => MatrixRecordCubit(context.read<FormRepository>())..setCurrentSubmittedForm(index)..loadMatrices(),
  child: UpdateFormPage(
                                            index: index,
                                            form: state.subedForms![index]),
)));
                              },
                              onViewCallBack: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlocProvider(
  create: (context) => MatrixRecordCubit(context.read<FormRepository>()),
  child: SubmittionsDetailsPage(formWidget: state.subedForms![index]),
)));
                              },
                              onDeleteCallBack: () {

                                _confirmDeleteDialog(context: context,onConfirm: (){
                                  context.read<ValidationBloc>().add(FormDeleted(index: index,
                                      formName: state.subedForms![index].name),);
                                });



                              },
                            ),
                          );
                        }),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class SubmissionCard extends StatelessWidget {

  List<Widget> _build(){
    List<Widget> list =[];

    for(int i = 0; i<form.fields.length ; i++){
        if(i == 3) {
          list.add( Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Expanded(
                  child: Text('. . .', textAlign:TextAlign.center,style: TextStyle(

                      fontSize: 20,
                    fontWeight: FontWeight.bold
                  )),
                ),


              ],
            ),
          ));
          break;

        }

        var field = form.fields[i];
        var textValue = field.value;
        if(textValue == null) textValue = 'empty';

        else textValue =  field.valueToString();
        list.add(   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 2),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Expanded(
                flex: 4,
                child: Text(field.label,style: TextStyle(
                    fontSize: 20
                ),),
              ),
              Expanded(
                flex: 2,
                child: Text(textValue,style: TextStyle(
                  overflow: TextOverflow.ellipsis,

                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        ),
        );
      }

    // if(form.fields.length>3)
    //   ,);
    return list;


    }




  const SubmissionCard(
      {Key? key,
      required this.onDeleteCallBack,
      required this.onViewCallBack,
      required this.form,
      required this.onUpdateCallBack})
      : super(key: key);
  final void Function()? onDeleteCallBack;
  final void Function()? onViewCallBack;
  final void Function()? onUpdateCallBack;
  final  FormWidget form;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 180,
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
            Expanded(
              flex: 13,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 ..._build()
                  ],
                ),
              ),
            ),
          Expanded(
              flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: onViewCallBack,
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: onUpdateCallBack,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: onDeleteCallBack,
                    icon: Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
void _confirmDeleteDialog ({required BuildContext context, void Function()? onConfirm}){
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Center(child: const Text('Please Confirm',style: TextStyle(
            fontWeight: FontWeight.bold,color: Colors.redAccent
          ),)),
          content: const Text('Are you sure to remove this submission?'),
          actions: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ElevatedButton(

                   onPressed: () {
                     onConfirm!();
                     // Close the dialog
                     Navigator.of(context).pop();
                   }
                   ,style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20)
                   ),
                   primary: Colors.redAccent
               )
                   , child: Text('Yes')),
               SizedBox(width: 20,),
               ElevatedButton(

                   onPressed: () {
                     // Close the dialog
                     Navigator.of(context).pop();
                   },
                   style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20)
                       ),
                       primary: Colors.lightBlueAccent
                   )
                   , child: Text('No')),
             ],
           )

          ],
        );
      });
}
void _formDetailsDialog ({required BuildContext context, void Function()? onConfirm,required FormWidget form}){
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(

          title: Center(child: const Text('Form Details')),
          content: Container(
            height: 300,
            width: 400,
            child: ListView.builder(shrinkWrap: true,itemCount: form.fields.length,itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(form.fields[index].label),
                    Text(form.fields[index].value.toString(),style: TextStyle(fontWeight: FontWeight.bold),),


                  ],

                ),
              );
            }),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                
            onPressed: (){
                  Navigator.of(context).pop();

              }
              ,style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                    primary: Colors.lightBlueAccent
                  )
              , child: Text('okay')),
            )
          ],
          // actions: [
          //   // The "Yes" button
          //   TextButton(
          //       onPressed: () {
          //             onConfirm!();
          //         // Close the dialog
          //         Navigator.of(context).pop();
          //       },
          //       child: const Text('Yes')),
          //   TextButton(
          //       onPressed: () {
          //         // Close the dialog
          //         Navigator.of(context).pop();
          //       },
          //       child: const Text('No'))
          // ],
        );
      });
}