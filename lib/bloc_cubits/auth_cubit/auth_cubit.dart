import 'package:hrm/theme/app_shared_preferences_constant.dart';
import 'package:hrm/storage/cache/secure_storage_helper.dart';
import 'package:hrm/bloc_cubits/auth_cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:async';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  Future isSignedIn() async {
    Timer(const Duration(seconds: 3), () async {
      var userEmail =
          await SecStore.getValue(keyVal: SharedPreferencesConstant.userEmail);
      var userType =
          await SecStore.getValue(keyVal: SharedPreferencesConstant.userType);
      if (userEmail != null && userType != null) {
        emit(const AuthLoginSuccess());
      } else {
        emit(const AuthLoginFailure());
      }
    });
  }
}
