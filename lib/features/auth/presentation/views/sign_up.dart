import 'package:flutter/material.dart';
import 'package:notes/features/auth/presentation/views/widgets/sign_up_body.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
 Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpBody(),
    );
  }
}