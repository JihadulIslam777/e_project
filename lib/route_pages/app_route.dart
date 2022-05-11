part of 'app_page.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const splash = _Paths.splash;
  static const main = _Paths.main;
  static const navbar = _Paths.navBar;
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const signup = _Paths.signup;
  static const forgotPassword = _Paths.forgotPassword;
  static const settings = _Paths.settings;
  static const test = _Paths.test;
}

abstract class _Paths {
  static const String splash = '/';
  static const String main = 'main';
  static const String navBar = 'navbar';
  static const String home = 'home';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String forgotPassword = 'forgotpassword';
  static const String settings = '/settings';
  static const String test = '/test';
}
