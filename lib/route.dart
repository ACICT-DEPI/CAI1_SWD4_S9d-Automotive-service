import 'package:demi1/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit.dart';
import 'login_screen.dart';

class AppRoute {
  AppCubit cubitObject = AppCubit();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/': // Use to reach home page
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => cubitObject,
                  child: const LoginScreen(),
                ));
      case '/register': // Use strings for route names
        return MaterialPageRoute(builder: (_) => RegisterScreen());
    }
    return null;
  }
}
