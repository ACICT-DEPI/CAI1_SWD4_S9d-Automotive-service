import 'package:demi1/presentation/services/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit-spare.dart';
import 'myorders.dart';

class SpareParts extends StatefulWidget {
  @override
  State<SpareParts> createState() => _SparePartsState();
}

class _SparePartsState extends State<SpareParts> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SparePartCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
          ),
          title: Text(
            'Spare Parts',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[700],
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<SparePartCubit, SparePartState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    //  alignment: Alignment.bottomCenter,
                                    children: [
                                      Image(
                                        image: AssetImage("assets/3s.jpg"),
                                        width: 240,
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Fuel Filter",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Stock :  ${state.fuelFilterStock}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "\$20 ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.indigo[700],
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<SparePartCubit>()
                                        .orderSparePart('fuelFilter');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Myorders()));
                                  },
                                  child: Text(
                                    "Order",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    //  alignment: Alignment.bottomCenter,
                                    children: [
                                      Image(
                                        image: AssetImage("assets/6s.jpg"),
                                        width: 240,
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Battery",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Stock : ${state.batteryStock}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "\$700 ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.indigo[700],
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<SparePartCubit>()
                                        .orderSparePart('battery');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Myorders()));
                                  },
                                  child: Text(
                                    "Order",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    //  alignment: Alignment.bottomCenter,
                                    children: [
                                      Image(
                                        image: AssetImage("assets/1se.jpg"),
                                        width: 210,
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Front Glass",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Stock :  ${state.frontGlassStock}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "\$300 ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.indigo[700],
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<SparePartCubit>()
                                        .orderSparePart('frontGlass');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Myorders()));
                                  },
                                  child: Text(
                                    "Order",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    //  alignment: Alignment.bottomCenter,
                                    children: [
                                      Image(
                                        image: AssetImage("assets/4s.jpg"),
                                        width: 240,
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Mirror",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Stock :  ${state.mirrorsStock}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "\$90 ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.indigo[700],
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<SparePartCubit>()
                                        .orderSparePart('mirrors');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Myorders()));
                                  },
                                  child: Text(
                                    "Order",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    //  alignment: Alignment.bottomCenter,
                                    children: [
                                      Image(
                                        image: AssetImage("assets/2s.jpg"),
                                        width: 240,
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Oil Filter",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Stock :  ${state.oilFilterStock}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "\$30 ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.indigo[700],
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<SparePartCubit>()
                                        .orderSparePart('oilFilter');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Myorders()));
                                  },
                                  child: Text(
                                    "Order",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    //  alignment: Alignment.bottomCenter,
                                    children: [
                                      Image(
                                        image: AssetImage("assets/7s.jpg"),
                                        width: 240,
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Wipers",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Stock :  ${state.wiperStock}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "\$130 ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.indigo[700],
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<SparePartCubit>()
                                        .orderSparePart('wiper');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Myorders()));
                                  },
                                  child: Text(
                                    "Order",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Stack(
                                    //  alignment: Alignment.bottomCenter,
                                    children: [
                                      Image(
                                        image: AssetImage("assets/5s.jpg"),
                                        width: 240,
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Tyers",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Stock :  ${state.tyresStock}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "\$900 ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.indigo[700],
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<SparePartCubit>()
                                        .orderSparePart('tyres');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Myorders()));
                                  },
                                  child: Text(
                                    "Order",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
