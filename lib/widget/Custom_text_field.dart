import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.onChanged,
      this.hint,
      this.text,
      this.textInputType,
      this.obscureText = false});

  String? hint;
  String? text;
  bool? obscureText;
  TextInputType? textInputType;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText!,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return (text);
      //   }
      // },
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(
          '$hint',
        ),
        // border: const OutlineInputBorder(
        //   Colors.amber,
        //   borderSide: BorderSide(
        //     color: Colors.white
        //     ),
        // ),
        border: OutlineInputBorder(
            borderSide: BorderSide(), borderRadius: BorderRadius.circular(8)),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(), borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
