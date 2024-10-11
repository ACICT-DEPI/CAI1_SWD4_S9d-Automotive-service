import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[700],
          ),
        ),
        centerTitle: true,
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search services...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 15),
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
                    title: 'Wheel Service',
                    imagePath: 'assets/s3.jpg', // Add your image path
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const DetailScreen('Wheel Service'))),
                  ),
                ),
                Card(
                  elevation: 3,
                  color: Colors.white,
                  child: ServiceBox(
                    title: 'Engine Service',
                    imagePath: 'assets/s2.jpg', // Add your image path
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const DetailScreen('Engine Service'))),
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
                    title: 'Oil Service',
                    imagePath: 'assets/s1.jpg', // Add your image path
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailScreen('Oil Service'))),
                  ),
                ),
                Card(
                  elevation: 3,
                  color: Colors.white,
                  child: ServiceBox(
                    title: 'Gas Service',
                    imagePath: 'assets/s6.jpg', // Add your image path
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailScreen('Gas Service'))),
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
                            builder: (_) => DetailScreen('Oil Service'))),
                  ),
                ),
                Card(
                  elevation: 3,
                  color: Colors.white,
                  child: ServiceBox(
                    title: 'Body Service',
                    imagePath: 'assets/s5.jpg', // Add your image path
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailScreen('Gas Service'))),
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

class DetailScreen extends StatelessWidget {
  final String serviceName;

  const DetailScreen(this.serviceName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(serviceName)),
      body: Center(
        child:
            Text('Details about $serviceName', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
