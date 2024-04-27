import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/utils/router_app.dart';
import 'package:notes/features/home/presentaion/views/manager/add_note_cubit/add_note_cubit.dart';

import 'package:notes/features/home/presentaion/views/widgets/custom_floating_action_button.dart';
import 'package:notes/features/home/presentaion/views/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                await signOutAndNavigate(context);
              },
              icon: const Icon(
                Icons.login_outlined,
                color: Colors.white,
              ))
        ],
      ),
      floatingActionButton: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: const CustomFloatingActionButton(),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: HomePageBody(),
        ),
      ),
    );
  }

  Future<void> signOutAndNavigate(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    GoRouter.of(context).pushReplacement(AppRouter.kSignInRoute);
  }
}
