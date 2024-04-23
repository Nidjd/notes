import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginRepo {
  Future<Either<FirebaseAuthException, UserCredential>> login({
    required String email,
    required String password,
    required BuildContext context
  });
}
