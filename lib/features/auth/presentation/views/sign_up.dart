import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:notes/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:notes/features/auth/presentation/views/widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(
          
        ),
        child: const SignUpBody(),
      ),
    );
  }
}
