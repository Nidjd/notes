import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/features/home/presentaion/views/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes/features/home/presentaion/views/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes/features/home/presentaion/views/widgets/custom_expansion_item.dart';
import 'package:notes/features/home/presentaion/views/widgets/custom_expansion_item_builder.dart';

import 'package:notes/features/home/presentaion/views/widgets/custom_floating_action_button.dart';
import 'package:notes/features/home/presentaion/views/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: const CustomFloatingActionButton(),
      ),
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: BlocProvider(
            create: (context) => GetNotesCubit(),
            child: const HomePageBody(),
          ),
        ),
      ),
    );
  }
}
