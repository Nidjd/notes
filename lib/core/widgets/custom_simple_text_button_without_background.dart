import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

class CustomSimpleTextButton extends StatelessWidget {
  const CustomSimpleTextButton(
      {super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: fourthColor, fontWeight: FontWeight.bold),
        ));
  }
}
