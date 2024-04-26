import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/core/widgets/custom_progress_indicator.dart';
import 'package:notes/features/home/presentaion/views/widgets/custom_expansion_item.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('notes')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('subNotes')
            .orderBy('title')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) => CustomExpansionItem(
                title: snapshot.data!.docs[index]['title'],
                subject: snapshot.data!.docs[index]['subject'],
                color: snapshot.data!.docs[index]['color'],
              ),
              itemCount: snapshot.data!.docs.length,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error !"),
            );
          } else {
            return const CustomProgressIndicator();
          }
        },
      ),
    );
  }
}
