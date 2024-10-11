import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:demi1/core/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buissness-logic/app_cubit.dart';
import '../../buissness-logic/appstatus.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailControllersign = TextEditingController();
  final TextEditingController passwordControllersign = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStatus>(
      builder: (context, state) {
        AppCubit cubitObject = context.read<AppCubit>();
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade50,
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email input
                    _buildInputField(
                      controller: emailControllersign,
                      label: "Email",
                      hint: "Enter your email",
                      icon: Icons.email,
                      validator: (value) =>
                          value!.isEmpty ? "Enter your email" : null,
                    ),
                    const SizedBox(height: 20),

                    // Password input
                    _buildInputField(
                      controller: passwordControllersign,
                      label: "Password",
                      hint: "Enter your Password",
                      icon: Icons.lock,
                      obscureText: cubitObject.isSecure,
                      validator: (value) =>
                          value!.isEmpty ? "Enter your password" : null,
                      suffixIcon: IconButton(
                        onPressed: () => cubitObject.changeIsSecuse(),
                        icon: cubitObject.isSecure
                            ? const Icon(Icons.visibility_off,
                                color: Colors.grey)
                            : const Icon(Icons.visibility, color: Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Login button
                    _buildLoginButton(context, cubitObject),

                    const SizedBox(height: 20),
                    _buildRegisterRow(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.blueAccent),
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, AppCubit cubitObject) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await cubitObject.loginFunction(
              email: emailControllersign.text,
              password: passwordControllersign.text,
            );

            if (cubitObject.state is SignInByEmailDoneStatus) {
              await cubitObject.customeAwesomeDialog(
                DialogType: DialogType.success,
                context: context,
                titel: 'Successful',
                desc: 'Login successful',
              );

              emailControllersign.clear();
              passwordControllersign.clear();
              Navigator.pushNamed(context, '/layout');
            } else if (cubitObject.state is SignInByEmailfaildStatus) {
              final errorState = cubitObject.state as SignInByEmailfaildStatus;

              await cubitObject.customeAwesomeDialog(
                DialogType: DialogType.error,
                context: context,
                titel: 'Error',
                desc: errorState.error,
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildRegisterRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account?",
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            "Register Now",
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
