import 'package:demi1/app_cubit.dart';
import 'package:demi1/appstatus.dart';
import 'package:demi1/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStatus>(
      builder: (context, state) {
        AppCubit cubitObject = context.read<AppCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      customizedInputField(
                          controller: emailController,
                          maxLenght: 100,
                          prefixIcon: const Icon(
                            Icons.email,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Enter your email",
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "enter your email";
                            }
                            return null;
                          },
                          labelText: "Email"),
                      const SizedBox(
                        height: 20,
                      ),
                      customizedInputField(
                          controller: passwordController,
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
                      const SizedBox(
                        height: 20,
                      ),
                      customizedInputField(
                          controller: phoneController,
                          maxLenght: 12,
                          keyboardType: TextInputType.number,
                          hintText: "Enter your phone number",
                          prefixIcon: const Icon(
                            Icons.phone,
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "enter your phone number";
                            }
                            return null;
                          },
                          labelText: "Phone number"),
                      const SizedBox(
                        height: 20,
                      ),
                      customizedInputField(
                          controller: addressControler,
                          maxLenght: 100,
                          keyboardType: TextInputType.text,
                          prefixIcon: const Icon(
                            Icons.location_city,
                          ),
                          hintText: "Enter your address",
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "enter your address";
                            }
                            return null;
                          },
                          labelText: "Address"),
                      const SizedBox(
                        height: 20,
                      ),
                      customizedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubitObject.registerByEmailAndPassword(
                                  address: addressControler.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  email: emailController.text);

                              if (state is RegisterByEmailDoneStatus) {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: 'Transaction Completed Successfully!',
                                );
                                emailController.clear();
                                passwordController.clear();
                                passwordController.clear();
                                addressControler.clear();
                                Navigator.pushNamed(context, '/');
                              }
                              // appear to user a message to check registration and .then go to login to enter app

                              //
                            }
                          },
                          text: "Register"),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
