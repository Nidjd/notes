import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerNewAccount(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(RegisterLoadingState());
    
  }
}
