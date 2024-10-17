import 'package:demi1/presentation/services/spare-parts.dart';
import 'package:demi1/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(homeRoute: AppRoute()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.homeRoute});
  final AppRoute homeRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0.0)),
      onGenerateRoute: homeRoute.generateRoute,
    );
  }
}
