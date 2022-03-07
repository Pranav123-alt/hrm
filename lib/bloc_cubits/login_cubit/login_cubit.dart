import 'package:hrm/bloc_cubits/login_cubit/login_state.dart';
import 'package:hrm/storage/cache/secure_storage_helper.dart';
import 'package:hrm/theme/app_shared_preferences_constant.dart';
import 'package:hrm/validations/password_validation.dart';
import 'package:hrm/validations/email_validation.dart';
import 'package:hrm/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(const LoginState());

  final AuthRepository _authRepository;
  String? loginStatus;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email, state.password]),
    ));
  }

  // auth_screen logout
  Future logout() async {
    await SecStore.deleteAll();
  }

  Future<void> userLogin() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    loginStatus =
        _authRepository.userLogin(state.email.value, state.password.value);
    if (loginStatus == '0') {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          exceptionError: 'User dose not exists!'));
    } else if (loginStatus == '2') {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          exceptionError: 'Password Not match!'));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
