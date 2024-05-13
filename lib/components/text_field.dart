// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const textField({
    super.key, 
    required this.hintText,
    required this.obscureText,
    required this.controller,});
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary), 
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
        ),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        hintText: hintText
      ),
    );
  }
}