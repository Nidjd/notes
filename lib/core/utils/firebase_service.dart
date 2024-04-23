import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth firebaseAuth;
  FirebaseService(this.firebaseAuth);

  Future<UserCredential> register(
      {required String email, required String password}) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    firebaseAuth.currentUser!.sendEmailVerification();
    return userCredential;
  }

  Future<UserCredential> login(
      {required String email, required String password}) async {
    UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user;
  }
}
