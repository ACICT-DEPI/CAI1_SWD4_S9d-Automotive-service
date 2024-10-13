import 'package:demi1/presentation/services/spare-parts.dart';
import 'package:demi1/presentation/services/winch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'clean.dart';

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Our Services',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                // color: Colors.blue[100],
                //border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 25),
            Image.asset(
              "assets/main.jpg",
            ),
            // Divider(thickness: 2),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 3,
                  color: Colors.white,
                  child: ServiceBox(
                    title: 'Rescue Winch',
                    imagePath: 'assets/s2.jpg', // Add your image path
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const RescueWinch())),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 3,
                  color: Colors.white,
                  child: ServiceBox(
                    title: 'Clean Service',
                    imagePath: 'assets/s4.jpg', // Add your image path
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CleanServiceScreen())),
                  ),
                ),
                Card(
                  elevation: 3,
                  color: Colors.white,
                  child: ServiceBox(
                    title: 'Body Service',
                    imagePath: 'assets/s5.jpg', // Add your image path
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SpareParts())),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceBox extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const ServiceBox({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 50), // Add your image path
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
