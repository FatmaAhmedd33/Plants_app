import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.onchange, super.key, required this.text});
  final String text;
  Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        //chang from textfield to text form field to able make a validation conditions
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
        },
        onChanged: onchange,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.white),
          ),
          hintText: text,
          hintStyle: const TextStyle(color: Colors.white),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
        ));
  }
}
