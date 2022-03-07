import 'package:hrm/validations/confirm_password_validation.dart';
import 'package:hrm/validations/number_validation,dart.dart';
import 'package:hrm/bloc_cubits/reg_cubit/reg_state.dart';
import 'package:hrm/validations/password_validation.dart';
import 'package:hrm/validations/email_validation.dart';
import 'package:hrm/validations/field_validation.dart';
import 'package:hrm/utils/encryption_utils.data.dart';
import 'package:hrm/validations/name_validation.dart';
import 'package:hrm/repository/auth_repository.dart';
import 'package:hrm/validations/dob_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm/models/user_model.dart';
import 'package:formz/formz.dart';

class RegCubit extends Cubit<RegState> {
  RegCubit(this._authRepository) : super(const RegState());

  final AuthRepository _authRepository;
  String? signupStatus;

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name, state.email, state.password]),
    ));
  }

  void numberChanged(String value) {
    final mobileNo = Number.dirty(value);
    emit(state.copyWith(
      number: mobileNo,
      status: Formz.validate([mobileNo, state.email, state.password]),
    ));
  }

  void dobChanged(String value) {
    final dob = DOB.dirty(value.toString());
    emit(state.copyWith(
      dob: dob,
      status: Formz.validate([dob, state.email, state.password]),
    ));
  }

  void locationChanged(String value) {
    final location = Field.dirty(value.toString());
    emit(state.copyWith(
      location: location,
      status: Formz.validate([location, state.email, state.password]),
    ));
  }

  void genderChanged(String value) {
    final gender = Field.dirty(value.toString());
    emit(state.copyWith(
      gender: gender,
      status: Formz.validate([gender, state.email, state.password]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.name, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.name, state.email]),
    ));
  }

  void confirmPassword(String pass, String conPass) {
    final confirmPassword =
        ConfirmPassword.dirty(password: pass, value: conPass);
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      status: Formz.validate([confirmPassword, state.name, state.email]),
    ));
  }

  Future<void> userReg(String userType) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    UserModel userModel = UserModel(
        fullName: EncryptData.encryptAES(state.name.value),
        email: EncryptData.encryptAES(state.email.value),
        phone: EncryptData.encryptAES(state.number.value),
        password: EncryptData.encryptAES(state.password.value),
        userType: EncryptData.encryptAES(userType));
    signupStatus = _authRepository.userRegistrationUser(userModel);
    if (signupStatus == '0') {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          exceptionError: 'User already exists!'));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
