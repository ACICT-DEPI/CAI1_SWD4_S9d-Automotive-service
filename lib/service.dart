import 'package:flutter/material.dart';

Widget customizedButton({
  required void Function()? onPressed,
  required String text,
}) =>
    SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.blue),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );

// ignore: non_constant_identifier_names
Widget customizedInputField(
        {required controller,
        required int maxLenght,
        required TextInputType keyboardType,
        required String hintText,
        required String labelText,
        Widget? suffixIcon,
        bool obscureText = false}) =>
    SizedBox(
        height: 80,
        child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            maxLines: 1,
            maxLength: maxLenght,
            onFieldSubmitted: (String email) {
              print(email);
            },
            keyboardType: keyboardType,
            decoration: InputDecoration(
                border:
                    const OutlineInputBorder(borderRadius: BorderRadius.zero),
                hintText: hintText,
                labelText: labelText,
                suffixIcon: suffixIcon != null ? suffixIcon : null,
                labelStyle: const TextStyle(fontSize: 20))));
