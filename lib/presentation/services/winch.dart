import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RescueWinch extends StatelessWidget {
  const RescueWinch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Rescue Winch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[700],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/winch.jpg",
              //   //  color: Colors.indigo[200],
            ),
            const Card(
              elevation: 3,
              color: Color(0xFF2B477E),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Why Us ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 2,
                    indent: 120,
                    endIndent: 120,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    " ☛  Provides 24 hour service.\n ☛  Availability of the latest types\n\t\t     of car rescue cranes.\n ☛  Speed in reaching your car location.\n ☛  Providing all rescue services \n \t     at the lowest prices. \n",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Card(
              elevation: 3,
              color: Color(0xFF2B477E),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Costs ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 2,
                    indent: 120,
                    endIndent: 120,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "☛  Less than 100 KM 500 L.E .\n☛  Less than 200 KM 1000 L.E .\n☛  Less than 300 KM 1500 L.E .\n ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 3,
              color: const Color(0xFF2B477E),
              child: Column(
                children: [
                  const Text(
                    "Numbers ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 2,
                    indent: 120,
                    endIndent: 120,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final Uri url = Uri(
                        scheme: 'tel',
                        path: "01157978348",
                      );
                      await launchUrl(url);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        print("Could not dial 01095545002");
                      }
                    },
                    child: const Text(
                      "01157978348 ",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
GestureDetector(
                    onTap: () async {
                      final Uri url = Uri(
                        scheme: 'tel',
                        path: "01095545002",
                      );
                      await launchUrl(url);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        print("Could not dial 01095545002");
                      }
                    },
                    child: const Text(
                      "01157978348 ",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),*/