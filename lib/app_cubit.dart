import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'appstatus.dart';

class AppCubit extends Cubit<AppStatus> {
  AppCubit() : super(InitialAppState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late UserCredential credential;

  void registerByEmailAndPassword() async {
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "haipppb1@gmail.com",
        password: "123456",
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user?.uid)
          .set({
        "phone": "01095545002",
        "address": "habiba amr",
      }).then((value) {
        print("Everything is done");
        print(credential.user?.uid); // Now you can safely access the UID
        emit(xxxxxxx());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
