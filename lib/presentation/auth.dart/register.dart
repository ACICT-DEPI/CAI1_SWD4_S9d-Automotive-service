import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:demi1/buissness-logic/app_cubit.dart';
import 'package:demi1/buissness-logic/appstatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStatus>(
      builder: (context, state) {
        AppCubit cubitObject = context.read<AppCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.blue.shade50,
            elevation: 0,
          ),
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
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildInputField(
                      controller: emailController,
                      label: "Email",
                      hint: "Enter your email",
                      icon: Icons.email,
                      validator: (value) =>
                          value!.isEmpty ? "Enter your email" : null,
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                      controller: passwordController,
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
                    const SizedBox(height: 20),
                    _buildInputField(
                      controller: phoneController,
                      label: "Phone Number",
                      hint: "Enter your phone number",
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value!.isEmpty ? "Enter your phone number" : null,
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                      controller: addressController,
                      label: "Address",
                      hint: "Enter your address",
                      icon: Icons.location_city,
                      validator: (value) =>
                          value!.isEmpty ? "Enter your address" : null,
                    ),
                    const SizedBox(height: 30),
                    _buildRegisterButton(context, cubitObject),
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
    TextInputType keyboardType = TextInputType.text,
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
        keyboardType: keyboardType,
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

  Widget _buildRegisterButton(BuildContext context, AppCubit cubitObject) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await cubitObject.registerByEmailAndPassword(
              email: emailController.text,
              phone: phoneController.text,
              password: passwordController.text,
              address: addressController.text,
            );

            if (cubitObject.state is RegisterByEmailDoneStatus) {
              await cubitObject.customeAwesomeDialog(
                DialogType: DialogType.success,
                context: context,
                titel: 'Successful',
                desc: 'Register successful',
              );

              emailController.clear();
              passwordController.clear();
              phoneController.clear();
              addressController.clear();
              Navigator.pushNamed(context, '/login');
            } else if (cubitObject.state is RegisterByEmailfaildStatus) {
              final errorState =
                  cubitObject.state as RegisterByEmailfaildStatus;
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
          "Register",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
