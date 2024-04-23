import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes/core/utils/firebase_service.dart';
import 'package:notes/core/utils/show_alert.dart';
import 'package:notes/features/auth/data/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final FirebaseService firebaseService;

  RegisterRepoImpl(this.firebaseService);
  @override
  Future<Either<FirebaseAuthException, UserCredential>> registerNewAccount(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      var userCred =
          await firebaseService.register(email: email, password: password);
      return right(userCred);
    } on FirebaseAuthException catch (e) {
      showAlert(context, e.code, 'Warning');
      return left(e);
    }
  }
}
