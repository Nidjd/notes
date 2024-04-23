import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:notes/features/auth/data/login_repo.dart';
import 'package:notes/features/auth/data/login_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoadingState());
    var result = await loginRepo.login(
        email: email, password: password, context: context);

    result.fold((l) {
      emit(LoginFailureState(l.message.toString()));
    }, (r) {
      emit(LoginSuccessState());
    });
  }
}
