

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {

  final String? text;
  final String? hintText;
  final TextEditingController controller;
  final IconData? icon;
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validator;

  const CustomTextfield({
    super.key,
    this.text,
    this.hintText,
    required this.controller,
    this.icon,
    this.minLines,
    this.maxLines = 1,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: TextFormField(
        validator: validator,        
        autovalidateMode: AutovalidateMode.onUserInteraction,
        minLines: minLines,
        maxLines:  maxLines,
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          hintText: hintText,
          border: const OutlineInputBorder(),
          filled: true,
          prefixIcon: icon != null ? Icon(icon) : null
        ),
      ),
    );
  }
}