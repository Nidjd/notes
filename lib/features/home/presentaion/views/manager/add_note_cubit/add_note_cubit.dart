import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/core/utils/show_alert.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  var currentUser = FirebaseAuth.instance.currentUser;

  Future<void> addNote({
    required String title,
    required String subject,
    required int color,
    required BuildContext context,
  }) async {
    emit(AddNoteLoadingState());
    try {
     await FirebaseFirestore.instance.collection('notes').doc(currentUser!.uid).set({
        'title': title,
        'subject': subject,
        'color': color,
      });
      emit(AddNoteSuccessState());
    } on FirebaseException catch (e) {
      emit(AddNoteFailureState());
      showAlert(context, e.message.toString(), e.code);
    }
  }
}
