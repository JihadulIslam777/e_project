import 'package:e_project/navigation_bar.dart';
import 'package:e_project/settings.dart';
import 'package:e_project/sign_up.dart';
import 'package:e_project/splash_screen.dart';
import 'package:flutter/material.dart';

import '../forgot_password.dart';
import '../home_page.dart';
import '../log_in.dart';
part 'app_route.dart';

class AppPages {
  AppPages._();
  static const String initialRoute = AppRoutes.splash;
  static final routes = {
    AppRoutes.splash: (context) => const SplashScreen(),
    // AppRoutes.main: (context) => const NavBar(),
    AppRoutes.home: (context) => const HomePage(),
    AppRoutes.login: (context) => const LogIn(),
    AppRoutes.signup: (context) => const SignUp(),
    AppRoutes.forgotPassword: (context) => const ForgotPassword(),
    AppRoutes.settings: (context) => const Settings(),
  };
}
