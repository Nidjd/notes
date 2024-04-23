
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/utils/assets.dart';


import 'package:notes/core/utils/show_alert.dart';
import 'package:notes/core/widgets/custom_progress_indicator.dart';
import 'package:notes/core/widgets/custom_simple_text_button_without_background.dart';
import 'package:notes/core/widgets/custom_text_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';


import 'package:notes/features/auth/presentation/manager/register_cubit/register_cubit.dart';

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
  var keyForm = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: keyForm,
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Padding(
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
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
                    state is RegisterLoadingState
                        ? const CustomProgressIndicator()
                        : CustomTextButton(
                            color: secondryColor,
                            onPressed: () {
                              signUp(emailController.text,
                                  passwordController.text, context);
                              showAlert(context,
                                  'Please check out your email box', 'Warning');
                                   GoRouter.of(context).pop();
                              // if (FirebaseAuth.instance.currentUser != null &&
                              //     FirebaseAuth.instance.currentUser!.emailVerified) {
                              //   GoRouter.of(context)
                              //       .pushReplacement(AppRouter.kHomeRoute);
                              // }
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
            );
          },
        ),
      ),
    );
  }

  void signUp(String email, String password, BuildContext context) async {
    if (keyForm.currentState!.validate()) {
      
    }
  }
}
