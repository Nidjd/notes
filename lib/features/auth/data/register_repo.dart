import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

abstract class RegisterRepo {
  Future<Either<FirebaseAuthException,UserCredential>> registerNewAccount({required String email,required String password,required BuildContext context});
}
