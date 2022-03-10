import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hrm/bloc_cubits/login_cubit/login_cubit.dart';
import 'package:hrm/bloc_cubits/theme_cubit/theme_cubit.dart';
import 'package:hrm/bloc_cubits/theme_cubit/theme_state.dart';
import 'package:hrm/bloc_cubits/auth_cubit/auth_state.dart';
import 'package:hrm/bloc_cubits/auth_cubit/auth_cubit.dart';
import 'package:hrm/bloc_cubits/reg_cubit/reg_cubit.dart';
import 'package:hrm/storage/local/objectbox_helper.dart';
import 'package:hrm/localization/app_localization.dart';
import 'package:hrm/routes/app_routes.dart' as route;
import 'package:hrm/repository/auth_repository.dart';
import 'package:hrm/repository/lang_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm/Screens/splash_screen.dart';
import 'package:hrm/Screens/login_screen.dart';
import 'package:hrm/Screens/home_screen.dart';
import 'package:provider/src/provider.dart';
import 'package:hrm/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'Screens/admin/add_employee.dart';
import 'bloc_cubits/emp_cubit/emp_cubit.dart';

late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(ThemeRepository())),
        BlocProvider(create: (context) => LoginCubit(AuthRepository())),
        BlocProvider(create: (context) => RegCubit(AuthRepository())),
        BlocProvider(create: (context) => EmpCubit(AuthRepository())),
        BlocProvider(create: (context) => AuthCubit()..isSignedIn()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
          buildWhen: (previousState, currentState) =>
              previousState != currentState,
          builder: (context, state) {
            return MaterialApp(
              title: 'Human Resoure Managmant',
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: context.select(
                  (ThemeCubit themeCubit) => themeCubit.state.themeMode),
              onGenerateRoute: route.controller,
              locale: state.locale,
              localizationsDelegates: const [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
                Locale('es', ''), // Spanish, no country code
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale?.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              home: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, authState) {
                if (authState is AuthInitialState) {
                  return const SplashScreen();
                } else if (authState is AuthLoginSuccess) {
                  return const HomeScreen();
                } else if (authState is AuthLoginFailure) {
                  return AddEmployee();
                }
                return const SplashScreen();
              }),
            );
          }),
    );
  }
}
