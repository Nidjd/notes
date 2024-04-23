// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
import 'package:flutter/material.dart';

import 'package:notes/core/utils/firebase_service.dart';
import 'package:notes/core/utils/show_alert.dart';
import 'package:notes/features/auth/data/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  FirebaseService firebaseService;
  LoginRepoImpl(
    this.firebaseService,
  );
  @override
  Future<Either<FirebaseAuthException, UserCredential>> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      var result =
          await firebaseService.login(email: email, password: password);
      return right(result);
    } on FirebaseAuthException catch (e) {
      showAlert(context, e.message.toString(), e.code);
      return left(e);
    }
  }
}
