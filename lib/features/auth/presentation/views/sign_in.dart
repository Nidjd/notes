import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes/constants.dart';

import 'package:notes/core/utils/assets.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                DataAssets.logo,
                height: 90,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                emailController: emailController,
                hintText: 'Enter your email ',
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextFormField(
                emailController: emailController,
                hintText: 'Enter your password ',
              ),
              const SizedBox(
                height: 14,
              ),
              TextButton(
                style:  ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    secondryColor,
                  ),
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.all(
                      16,
                    ),
                  ),
                  shape:   MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)))                
                ),
                onPressed: () {},
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
