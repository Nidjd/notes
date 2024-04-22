
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.emailController,
    required this.hintText,
    this.isPassword = false,
  });

  final TextEditingController emailController;
  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'this field mus\'t be empty !';
        }
        return'';
      },
      obscureText: isPassword,
    );
  }
}