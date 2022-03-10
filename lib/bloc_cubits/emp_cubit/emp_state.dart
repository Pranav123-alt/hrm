import 'package:hrm/validations/confirm_password_validation.dart';
import 'package:hrm/validations/dob_validation.dart';
import 'package:hrm/validations/field_validation.dart';
import 'package:hrm/validations/number_validation,dart.dart';
import 'package:hrm/validations/password_validation.dart';
import 'package:hrm/validations/email_validation.dart';
import 'package:hrm/validations/name_validation.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class EmpState extends Equatable {
  const EmpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.name = const Name.pure(),
    this.dob = const DOB.pure(),
    this.location = const Field.pure(),
    this.gender = const Field.pure(),
    this.number = const Number.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = FormzStatus.pure,
    this.exceptionError = "",
  });

  final Email email;
  final Name name;
  final Number number;
  final DOB dob;
  final Field location;
  final Field gender;
  final Password password;
  final ConfirmPassword confirmPassword;
  final FormzStatus status;
  final String exceptionError;

  @override
  List<Object> get props => [
    email,
    name,
    password,
    dob,
    location,
    gender,
    number,
    confirmPassword,
    status,
    exceptionError
  ];

  EmpState copyWith({
    Email? email,
    Name? name,
    Password? password,
    DOB? dob,
    Field? location,
    Field? gender,
    Number? number,
    ConfirmPassword? confirmPassword,
    FormzStatus? status,
    String? exceptionError,
  }) {
    return EmpState(
      name: name ?? this.name,
      dob: dob ?? this.dob,
      location: location ?? this.location,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      number: number ?? this.number,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      exceptionError: exceptionError ?? this.exceptionError,
    );
  }
}
