import 'package:demi1/buissness-logic/app_cubit.dart';
import 'package:demi1/buissness-logic/appstatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStatus>(
      builder: (context, state) {
        final cubitObject = context.read<AppCubit>();
        return Scaffold(
          body: cubitObject.screens[cubitObject.bottomNavigationBar],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubitObject.bottomNavigationBar,
            onTap: (value) {
              cubitObject.bottomNavigationBarchange(value);
            },
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.miscellaneous_services),
                label: "Services",
              ),
            ],
          ),
        );
      },
    );
  }
}
