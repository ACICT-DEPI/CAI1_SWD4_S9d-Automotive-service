
import 'package:demi1/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit.dart';
import 'appstatus.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStatus>(
      builder: (context, state) {
        AppCubit cubitObject = context.read<AppCubit>();
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    customizedInputField(
                        controller: cubitObject.emailController,
                        maxLenght: 100,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Enter your email",
                        labelText: "Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    customizedInputField(
                        controller: cubitObject.passwordController,
                        maxLenght: 20,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        hintText: "Enter your Password",
                        labelText: "Password",
                        suffixIcon: Icon(Icons.visibility)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              cubitObject.registerByEmailAndPassword();
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
