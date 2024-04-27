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
  final newTitleController = TextEditingController();
  final newSubjectController = TextEditingController();

  @override
  void dispose() {
    newTitleController.dispose();
    newSubjectController.dispose();
    super.dispose();
  }

  void deleteNote(String id) {
    FirebaseFirestore.instance
        .collection('notes')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('subNotes')
        .doc(id)
        .delete();
  }

  void editNote({
    required String id,
  }) async {
    if (newTitleController.text == '') {
      await FirebaseFirestore.instance
          .collection('notes')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('subNotes')
          .doc(id)
          .update({
        'subject': newSubjectController.text,
      });
    } else if (newSubjectController.text == '') {
      await FirebaseFirestore.instance
          .collection('notes')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('subNotes')
          .doc(id)
          .update({'title': newTitleController.text});
    }
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text('Are you sure ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            deleteNote(snapshot.data!.docs[index].id);
                            GoRouter.of(context).pop();
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Edit',
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              hintText: 'title',
                            ),
                            controller: newTitleController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: newSubjectController,
                            decoration: const InputDecoration(
                              hintText: 'subject',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            editNote(id: snapshot.data!.docs[index].id);
                            newSubjectController.clear();
                            newTitleController.clear();
                            GoRouter.of(context).pop();
                          },
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
