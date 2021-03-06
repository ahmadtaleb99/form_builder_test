import 'package:flutter/material.dart';

class CheckboxWidget extends StatelessWidget  {
  const CheckboxWidget({Key? key, required this.label, this.validator}) : super(key: key);
  final String label;
  final String? Function(bool?)? validator;


  @override
  Widget build(BuildContext context) {
    bool ? _value  = false;

    return Row(
      children: [
        Text(label),
        FormField<bool>(
          validator: validator,
          builder: (FormFieldState<bool> fieldState) {

            return InkWell(
              child: Column(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                            _value = value;
                    },
                  ),


              if (fieldState.hasError)
              Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Text(
              fieldState.errorText!,
              style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 13,
              color: Colors.red[700],
              height: 0.5),
              ),
              )],
              ),
            );
          },
        )
      ],
    );
  }
}
