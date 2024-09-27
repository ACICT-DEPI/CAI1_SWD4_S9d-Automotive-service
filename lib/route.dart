import 'package:demi1/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'onboarding.dart';

class AppRoute {
  AppCubit cubitObject = AppCubit();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnBording());
      case '/login': // Use to reach home page
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => cubitObject,
                  child: LoginScreen(),
                ));
      case '/register': // Use strings for route names
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => cubitObject,
                  child: RegisterScreen(),
                ));
      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
    return null;
  }
}
