
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes/core/utils/service_locator.dart';
import 'package:notes/features/auth/data/register_repo_impl.dart';
import 'package:notes/features/auth/presentation/manager/cubit/register_cubit.dart';
import 'package:notes/features/auth/presentation/views/widgets/sign_up_body.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(
          getIt.get<RegisterRepoImpl>(),
        ),
        child: const SignUpBody(),
      ),
    );
  }
}
