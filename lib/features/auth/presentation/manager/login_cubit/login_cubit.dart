import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit() : super(LoginInitial());

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoadingState());
    
  }
}
