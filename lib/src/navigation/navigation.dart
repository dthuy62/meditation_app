import 'package:flutter/material.dart';
import 'package:meditation_app/src/features/choose_topics/view/choose_topics_screen.dart';
import 'package:meditation_app/src/features/login/view/login_screen.dart';
import 'package:meditation_app/src/features/login/view/sign_up_and_sign_in.dart';
import 'package:meditation_app/src/features/reminders/view/reminders_screen.dart';
import 'package:meditation_app/src/features/welcome/welcome.dart';



abstract class Routes {
  static const welcome = 'welcome';
  static const login = 'login';
  static const topics = 'topics';
  static const reminders = 'reminders';
  static const signUpAndSignIn = 'signupandsignin';
}

abstract class RouteGenerator {
  static Route<dynamic>? generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return AppPageRoute((context) => const WelcomeScreen(), settings);
      case Routes.signUpAndSignIn:
        return AppPageRoute((context) => const SignUpAndSignIn(), settings);
      case Routes.login:
        return AppPageRoute((context) => const LoginScreen(), settings);
      case Routes.topics:
        return AppPageRoute((context) => const ChooseTopicsScreen(), settings);
      case Routes.reminders:
        return AppPageRoute((context) => const RemindersScreen(), settings);
      default:
        throw 'Opppss! Sorry. We can\'n find destination route';
    }
  }
}

MaterialPageRoute<T> AppPageRoute<T>(
  Widget Function(BuildContext context) builder,
  RouteSettings settings, {
  bool maintainState = true,
  bool fullscreenDialog = false,
}) =>
    MaterialPageRoute(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
