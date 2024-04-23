import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:notes/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:notes/features/auth/presentation/views/widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child:  const Scaffold(
        body: SignInBody(),
      ),
    );
  }
}
