import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'package:notes/features/auth/data/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;
  Future<void> registerNewAccount(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(RegisterLoadingState());
    var result = await registerRepo.registerNewAccount(
        email: email, password: password, context: context);

    result.fold((l) {
      emit(RegisterFailureState(l.toString()));
    }, (r) {
      emit(RegisterSuccessState());
    });
  }
}
