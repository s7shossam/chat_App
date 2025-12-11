import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, this.onChanged, this.hintText});

  @override
  Function(String)? onChanged;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
