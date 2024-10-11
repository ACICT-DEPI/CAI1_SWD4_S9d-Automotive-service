import 'package:demi1/buissness-logic/app_cubit.dart';
import 'package:demi1/buissness-logic/appstatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/caredata.dart';

class FavoritesScreenLayout extends StatelessWidget {
  const FavoritesScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStatus>(
      builder: (context, state) {
        AppCubit cubitObject = context.read<AppCubit>();
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: const Text(
              'QuickCar',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Favorite Cars',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubitObject.favouritCarsL
                        .length, // Change this to your favorite items count
                    itemBuilder: (context, index) {
                      return FavoriteItemCard(
                          cubitObject.favouritCarsL[index], cubitObject);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget FavoriteItemCard(int id, cubitObject) => Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                cars[id - 1]["image"], // Replace with actual image URL
                width: 100,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cars[id - 1]["name"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    cars[id - 1]["company"],
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    cars[id - 1]["price"],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                cubitObject.removeFromFavorite(cars[id - 1]
                    ['id']); // Assuming this updates state correctly
              },
              icon: Icon(
                Icons.favorite,
                // Use a border icon if not favorite
                color: cubitObject.favouritCarsL.contains(
                        cars[id - 1]['id']) // Same condition for color
                    ? Colors.red
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
