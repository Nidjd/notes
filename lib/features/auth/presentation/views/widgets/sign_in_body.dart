import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/utils/assets.dart';
import 'package:notes/core/utils/router_app.dart';

import 'package:notes/core/widgets/custom_progress_indicator.dart';
import 'package:notes/core/widgets/custom_simple_text_button_without_background.dart';
import 'package:notes/core/widgets/custom_text_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';

import 'package:notes/features/auth/presentation/manager/login_cubit/login_cubit.dart';

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
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified) {
              GoRouter.of(context).push(AppRouter.kHomeRoute);
            }
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Form(
                key: formKey,
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
                    state is LoginLoadingState
                        ? const CustomProgressIndicator()
                        : CustomTextButton(
                            color: secondryColor,
                            onPressed: signIn,
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
          );
        },
      ),
    );
  }

  void signIn() async {
    print('abgagrargag');
    if (formKey.currentState!.validate()) {
      await BlocProvider.of<LoginCubit>(context).login(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      );
    }
  }
}
