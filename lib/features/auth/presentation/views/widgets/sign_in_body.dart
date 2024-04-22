import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/utils/assets.dart';
import 'package:notes/core/utils/router_app.dart';
import 'package:notes/core/widgets/custom_simple_text_button_without_background.dart';
import 'package:notes/core/widgets/custom_text_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({
    super.key,
  });

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Form(
            key: key,
            child: ListView(
              shrinkWrap: true,
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
                CustomTextButton(
                  color: secondryColor,
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      
                    }
                  },
                  text: 'Sign In',
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account ?'),
                    CustomSimpleTextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kSignUpRoute);
                      },
                      text: 'Sign Up',
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
