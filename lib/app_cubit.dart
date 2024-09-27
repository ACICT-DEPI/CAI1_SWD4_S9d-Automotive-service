import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'appstatus.dart';

class AppCubit extends Cubit<AppStatus> {
  AppCubit() : super(InitialAppState());

  late UserCredential credential;

  void registerByEmailAndPassword({
    required String email,
    required String phone,
    required String password,
    required String address,
  }) async {
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user?.uid)
          .set({
        "phone": phone,
        "address": address,
      }).then((value) {
        print("Everything is done"); // Now you can safely access the UID
        emit(RegisterByEmailDoneStatus());
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

  void loginFunction({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        emit(SignInByEmailDoneStatus());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  bool isSecure = true;
  void changeIsSecuse() {
    if (isSecure) {
      isSecure = false;
      emit(IsSecureState());
    } else {
      isSecure = true;
      emit(IsSecureState());
    }
  }
}
