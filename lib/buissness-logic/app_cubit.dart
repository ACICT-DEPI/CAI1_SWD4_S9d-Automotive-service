import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/layout_screens.dart/layout-favorite.dart';
import '../presentation/layout_screens.dart/layout-home.dart';
import '../presentation/layout_screens.dart/service_screen.dart';
import 'appstatus.dart';
import '/dio/diohelper.dart';
import '../../core/caredata.dart';

class AppCubit extends Cubit<AppStatus> {
  AppCubit() : super(InitialAppState());

  late UserCredential credential;

  Future<void> registerByEmailAndPassword({
    required String email,
    required String phone,
    required String password,
    required String address,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user?.uid)
          .set({
        "phone": phone,
        "address": address,
        "email": email,
        "password": password,
      }).then((value) async {
        emit(RegisterByEmailDoneStatus());
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'An unknown error occurred.';
      }
      emit(RegisterByEmailfaildStatus(errorMessage));
    } catch (e) {
      emit(RegisterByEmailfaildStatus("An unknown error occurred."));
    }
  }

  Future<void> loginFunction({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInByEmailDoneStatus());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = 'An unknown error occurred.';
      }
      emit(SignInByEmailfaildStatus(errorMessage));
    } catch (e) {
      emit(SignInByEmailfaildStatus('An unexpected error occurred.'));
    }
  }

  Future<void> addFavoriteCar(
      String userId, String carId, Map<String, dynamic> carDetails) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(carId)
          .set(carDetails);

      print('Car added to favorites!');
    } catch (e) {
      print('Error adding car to favorites: $e');
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

  Future<void> customeAwesomeDialog({
    required BuildContext context,
    required String titel,
    required String desc,
    required DialogType,
  }) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType,
      animType: AnimType.rightSlide,
      title: titel,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();

    emit(showAwsomeDialog());
  }

  List screens = [
    HomeLayout(),
    FavoritesScreenLayout(),
    ServiceScreen(),
  ];

  int bottomNavigationBar = 0;

  void bottomNavigationBarchange(int value) {
    bottomNavigationBar = value;
    emit(BottomNavigationBarState());
  }

  // api
/*
  List carMarks = [];
  //late Diohelper dataWebService;
  getData({required Diohelper dataWebService}) {
    dataWebService.getData(path: 'carmakes').then((value) {
      print("valuuuue" + value.data);
      carMarks = value as List;
      emit(HomeStatesuccess());
    }).catchError((error) {
      print(error);
      emit(HomeStatefailer());
    });
  }

*/

  List<String> carMarks = [];
//late Diohelper dataWebService;

  void getData({required Diohelper dataWebService}) {
    dataWebService.getData(path: 'carmakes').then((value) {
      print("value: $value");

      if (value.data is List) {
        carMarks = (value.data as List).cast<String>();
        emit(HomeStatesuccess());
      } else {
        print("Response data is not a List");
        emit(HomeStatefailer());
      }
    }).catchError((error) {
      print(error);
      emit(HomeStatefailer());
    });
  }

  List favouritCarsL = [];
  void favoriteCars(carId) async {
    if (favouritCarsL.contains(carId)) {
      favouritCarsL.remove(carId); // Remove from favorites
    } else {
      favouritCarsL.add(carId);
    }
    await updateFavoritesInFirestore();
    print(favouritCarsL);
    emit(AddFavouriteDone()); // Emit a new state after updating
  }

  void removeFromFavorite(carId) async {
    print(carId);
    if (favouritCarsL.contains(carId)) {
      favouritCarsL.remove(carId);
      await updateFavoritesInFirestore(); // Remove from favorites
    }
    emit(RemoveFavouriteDone()); // Emit the new state
  }

  Future<void> updateFavoritesInFirestore() async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        await FirebaseFirestore.instance.collection("users").doc(userId).set(
          {
            "favouritCarsL": favouritCarsL, // New field
          },
          SetOptions(
              merge:
                  true), // Merge option to add the new field without overwriting
        );
        print("Favorites updated successfully.");
      }
    } catch (e) {
      print("Error updating favorites in Firestore: $e");
    }
  }

  Future<void> loadFavoritesFromFirestore() async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .get();

        var data = userDoc.data() as Map<String, dynamic>;

        if (userDoc.exists) {
          // Check if the field exists and is a list
          if (userDoc.data() != null && data['favouritCarsL'] != null) {
            List<dynamic> favorites = data['favouritCarsL'];
            favouritCarsL = favorites.cast<String>(); // Cast to List<String>
            print("Favorites loaded: $favouritCarsL");
          } else {
            print("No favorites found for user.");
          }
        }
      }
    } catch (e) {
      print("Error loading favorites from Firestore: $e");
    }
  }
}
