import 'package:hrm/Screens/localization_screen/lang_screen.dart';
import 'package:hrm/bloc_cubits/login_cubit/login_cubit.dart';
import 'package:hrm/repository/auth_repository.dart';
import 'package:hrm/Screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm/screens/splash_screen.dart';
import 'package:hrm/screens/login_screen.dart';
import 'package:hrm/screens/home_screen.dart';
import 'package:hrm/screens/reg_screen.dart';
import 'package:flutter/material.dart';

const String registerScreen = 'registerScreen';
const String chooseLangScreen = 'langScreen';
const String settingScreen = 'settingScreen';
const String splashScreen = 'splashScreen';
const String loginScreen = 'loginScreen';
const String homeScreen = 'homeScreen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case registerScreen:
      return MaterialPageRoute(builder: (_) => const RegScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case settingScreen:
      return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(AuthRepository()),
              child: const ProfileScreen()));
    case chooseLangScreen:
      return MaterialPageRoute(builder: (_) => const LangScreen());
    default:
      throw ('this route name does not exist');
  }
}
