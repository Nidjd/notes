import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/presentaion/views/manager/add_note_cubit/add_note_cubit.dart';

import 'package:notes/features/home/presentaion/views/widgets/custom_floating_action_button.dart';
import 'package:notes/features/home/presentaion/views/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
}
