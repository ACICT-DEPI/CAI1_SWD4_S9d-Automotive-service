import 'package:demi1/buissness-logic/app_cubit.dart';
import 'package:demi1/buissness-logic/appstatus.dart';
import 'package:demi1/dio/diohelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/caredata.dart';
import '../../core/carmrk.dart';
import '../../data/model/car_model.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _ShowroomState();
}

class _ShowroomState extends State<HomeLayout> {
  List<Car> Cars = getCarList();
  List<Dealer> dealers = getDealerList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStatus>(builder: (context, state) {
      AppCubit cubitObject = context.read<AppCubit>();
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text("QuickCar",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Car Marks",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 155,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: carMark.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          8), // Add some space between items
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        15), // Rounded corners for each item
                                    child: Card(
                                      elevation: 4,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              carMark[index]["image"],
                                              height: 100,
                                              width: 120,
                                              // Cover ensures the image fills the space nicely
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          ////////////////////////////////////////////////////////////////////////////
                                          Text(
                                            carMark[index][
                                                "name"], // Label for each car mark
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "New Product",
                                style: TextStyle(fontSize: 25),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                // color: Colors.grey[300],
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 3,
                                  childAspectRatio: 1 / 2,
                                  children: List.generate(cars.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Handle tap event
                                      },
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.network(
                                                cars[index]['image'],
                                                height: 150,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                cars[index]['name'],
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                cars[index]['company'],
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 4.0),
                                              child: Text(
                                                "\$${cars[index]['price']}", // Assuming price is part of the car model
                                                style: const TextStyle(
                                                  color: Colors.deepOrange,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      cubitObject.favoriteCars(
                                                          cars[index][
                                                              'id']); // Assuming this updates state correctly
                                                    },
                                                    icon: Icon(
                                                      cubitObject.favouritCarsL
                                                              .contains(cars[
                                                                      index][
                                                                  'id']) // Check if the current car ID is in favorites
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border, // Use a border icon if not favorite
                                                      color: cubitObject
                                                              .favouritCarsL
                                                              .contains(cars[
                                                                      index][
                                                                  'id']) // Same condition for color
                                                          ? Colors.red
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ])));
    });
  }
}
