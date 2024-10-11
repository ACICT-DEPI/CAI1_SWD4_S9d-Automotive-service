import 'package:demi1/dio/diohelper.dart';
import 'package:demi1/presentation/layout/layout.dart';
import 'package:demi1/presentation/auth.dart/register.dart';
import 'package:demi1/presentation/layout_screens.dart/layout-favorite.dart';
import 'package:demi1/presentation/layout_screens.dart/layout-home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buissness-logic/app_cubit.dart';
import 'presentation/layout_screens.dart/service_screen.dart';
import 'presentation/auth.dart/login_screen.dart';
import 'presentation/onbording.dart/onboarding.dart';

class AppRoute {
  AppCubit cubitObject = AppCubit();
  Diohelper dio = Diohelper();

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
      case '/FavoritesScreenLayout': // Use strings for route names
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => cubitObject,
                  child: FavoritesScreenLayout(),
                ));
      case "/home":
        return MaterialPageRoute(builder: (_) => ServiceScreen());
      case '/HomeLayout': // Use strings for route names
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      cubitObject..getData(dataWebService: dio),
                  child: HomeLayout(),
                ));
      case "/layout":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => cubitObject,
                  child: Layout(),
                ));
    }
    return null;
  }
}
