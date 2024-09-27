import 'package:demi1/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'app_cubit.dart';
import 'appstatus.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailControllersign = TextEditingController();
  TextEditingController passwordControllersign = TextEditingController();
  var formKey = GlobalKey<FormState>();
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
              child: Form(
                key: formKey,
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
                          controller: emailControllersign,
                          maxLenght: 100,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icon(Icons.message),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "enter your email";
                            }
                            return null;
                          },
                          hintText: "Enter your email",
                          labelText: "Email"),
                      const SizedBox(
                        height: 20,
                      ),

                      // password
                      customizedInputField(
                          controller: passwordControllersign,
                          maxLenght: 20,
                          prefixIcon: const Icon(
                            Icons.security,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "enter your password";
                            }
                            return null;
                          },
                          obscureText: cubitObject.isSecure,
                          hintText: "Enter your Password",
                          labelText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                cubitObject.changeIsSecuse();
                              },
                              icon: cubitObject.isSecure
                                  ? const Icon(
                                      Icons.visibility_off,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                    ))),

                      const Row(
                        children: [
                          Spacer(),
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      customizedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubitObject.loginFunction(
                                  email: emailControllersign.text,
                                  password: passwordControllersign.text);
                              if (state is SignInByEmailDoneStatus) {
                                print(
                                    "Registration successful. Showing alert...");
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: 'Transaction Completed Successfully!',
                                );
                                emailControllersign.clear();
                                passwordControllersign.clear();
                                Navigator.pushNamed(context, '/home');
                              }
                            }
                          },
                          text: "Login"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don’t have an account?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
