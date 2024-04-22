import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/utils/assets.dart';
import 'package:notes/core/utils/show_alert.dart';
import 'package:notes/core/widgets/custom_simple_text_button_without_background.dart';
import 'package:notes/core/widgets/custom_text_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var key = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                SvgPicture.asset(
                  DataAssets.logo,
                  height: 90,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Enter your email ',
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Enter your password ',
                  isPassword: true,
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  hintText: 'Enter your password again',
                  isPassword: true,
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTextButton(
                  color: secondryColor,
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        showAlert(
                            context, 'The passwords do not match', 'Warning !');
                      }
                    } else {}
                  },
                  text: 'Sign Up',
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('already have an account ?'),
                    CustomSimpleTextButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      text: 'Sign In',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
