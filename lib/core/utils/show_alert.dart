import 'package:flutter/material.dart';

void showAlert(
  context,
  String message,
  String title,
) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(message),
      title: Text(title),
    ),
    
  );
}
