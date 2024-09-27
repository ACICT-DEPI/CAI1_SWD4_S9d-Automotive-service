
import 'package:demi1/service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter your email",
                labelText: "Email"),
            const SizedBox(
              height: 20,
            ),
            customizedInputField(
                controller: passwordController,
                maxLenght: 20,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                hintText: "Enter your Password",
                labelText: "Password",
                suffixIcon: Icon(Icons.visibility)),
            const SizedBox(
              height: 20,
            ),
            customizedInputField(
                controller: phoneController,
                maxLenght: 12,
                keyboardType: TextInputType.number,
                hintText: "Enter your phone number",
                labelText: "Phone number"),
            const SizedBox(
              height: 20,
            ),
            customizedInputField(
                controller: addressControler,
                maxLenght: 100,
                keyboardType: TextInputType.text,
                hintText: "Enter your address",
                labelText: "Address"),
            const SizedBox(
              height: 20,
            ),
            customizedButton(
                onPressed: () {
                  emailController.clear();
                  passwordController.clear();
                  // appear to user a message to check registration and .then go to login to enter app

                  Navigator.pushNamed(context, '/');
                },
                text: "Register"),
          ]),
        ),
      ),
    );
  }
}
