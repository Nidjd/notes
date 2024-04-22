import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[700],
        ),
      ),
      controller: controller,
      validator: (value) {
        if (value == '') {
          return 'this field mus\'t be empty !';
        }
        
      },
      obscureText: isPassword,
    );
  }
}
