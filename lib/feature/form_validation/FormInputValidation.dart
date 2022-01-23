import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormInputValidation extends StatefulWidget {
  const FormInputValidation({Key? key}) : super(key: key);

  @override
  _FormInputValidationState createState() => _FormInputValidationState();
}

class _FormInputValidationState extends State<FormInputValidation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _formInput(
        hint: "Masukkan Nama Lengkap",
        label: "Nama *",
        setStateInput: (value) {
          setState(() {
            print(value);
          });
        },
      ),
    );
  }

  Widget _formInput(
      {required String hint,
      required String label,
      required Function(String value) setStateInput,
      int maxLines = 1}) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }
}
