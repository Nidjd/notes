import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/presentaion/views/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes/features/home/presentaion/views/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes/features/home/presentaion/views/widgets/custom_expansion_item.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<GetNotesCubit, GetNotesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('notes')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('subNotes')
                .snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => CustomExpansionItem(
                title: snapshot.data!.docs[index]['title'],
                subject: snapshot.data!.docs[index]['subject'],
                color: snapshot.data!.docs[index]['color'],
              ),);
            },
          ),
        );
      },
    );
  }
}
