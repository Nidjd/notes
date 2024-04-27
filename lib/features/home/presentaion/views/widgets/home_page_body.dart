import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/widgets/custom_progress_indicator.dart';
import 'package:notes/features/home/presentaion/views/widgets/custom_expansion_item.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  void deleteNote(String id) {
    FirebaseFirestore.instance
        .collection('notes')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('subNotes')
        .doc(id)
        .delete();
  }

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
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Delete !',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      content: const Text('Are you sure ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            deleteNote(snapshot.data!.docs[index].id);
                            GoRouter.of(context).pop();
                          },
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  );
                },
                onPressed: () {},
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
