import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());
  var currentUser = FirebaseAuth.instance.currentUser;
  Future<QuerySnapshot<Map<String, dynamic>>> getNotes() async {
    var data = await FirebaseFirestore.instance
        .collection('notes')
        .doc(currentUser!.uid)
        .collection('subNotes')
        .get();
    return data;
  }
}
