import 'package:flutter/material.dart';

class Customtextfeild extends StatelessWidget {
  Customtextfeild(
      {this.labelText,
      this.hinttext,
      this.onChanged,
      this.obscureText = false,
      super.key});
  Function(String)? onChanged;
  String? hinttext;
  String? labelText;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.black),
      ),
      obscureText: obscureText!,
      onChanged: onChanged,
      validator: (data) {
        if (data!.isEmpty) {
          return 'this Feild is Required';
        }
      },
    );
  }
}
