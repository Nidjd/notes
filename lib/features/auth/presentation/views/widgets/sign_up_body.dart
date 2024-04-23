import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/utils/assets.dart';
import 'package:notes/core/utils/router_app.dart';
import 'package:notes/core/utils/service_locator.dart';
import 'package:notes/core/utils/show_alert.dart';
import 'package:notes/core/widgets/custom_progress_indicator.dart';
import 'package:notes/core/widgets/custom_simple_text_button_without_background.dart';
import 'package:notes/core/widgets/custom_text_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';
import 'package:notes/features/auth/data/register_repo.dart';
import 'package:notes/features/auth/data/register_repo_impl.dart';
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
    return BlocConsumer<RegisterCubit, RegisterState>(
      bloc: RegisterCubit(getIt.get<RegisterRepoImpl>()),
      listener: (context, state) {
       
        if (state is RegisterSuccessState) {
          showAlert(context, 'please check out your email box', 'verify');
        } else if (state is RegisterFailureState) {
          showAlert(context, state.errMessage, 'warning !');
        }
      },
      builder: (context, state) {
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
                              if (FirebaseAuth.instance.currentUser != null &&
                                  FirebaseAuth
                                      .instance.currentUser!.emailVerified) {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kHomeRoute);
                              }
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
      },
    );
  }

  void signUp(String email, String password, BuildContext context) async {
    if (key.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        await RegisterCubit(
          getIt.get<RegisterRepoImpl>(),
        ).registerNewAccount(
            email: email, password: password, context: context);
      } else {
        showAlert(context, 'the passwords do not match', 'Warning');
      }
    }
  }
}
