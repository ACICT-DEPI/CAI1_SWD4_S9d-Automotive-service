import 'package:flutter/material.dart';

class CleanServiceScreen extends StatefulWidget {
  const CleanServiceScreen({super.key});

  @override
  _CleanServiceScreenState createState() => _CleanServiceScreenState();
}

class _CleanServiceScreenState extends State<CleanServiceScreen> {
  String _address = '';
  String _selectedFrequency = '';

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          // Do something if needed
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _selectFrequency(String frequency) {
    if (_address.isEmpty) {
      _showSnackBar('Please enter your address first.');
    } else {
      setState(() {
        _selectedFrequency = frequency;
      });
      _showSnackBar('Address: $_address\nFrequency: $frequency');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: const Text(
          'Cleaning Service',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              // Image Section
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/clean.jpg'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Title

              const SizedBox(height: 8.0),
              // Location Text
              const Text(
                'Where',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 8.0),
              // Search Bar
              TextField(
                onChanged: (value) {
                  setState(() {
                    _address = value; // Update address as user types
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your location',
                ),
              ),
              const SizedBox(height: 20.0),
              // Frequency Text
              const Text(
                'Select Frequency',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 8.0),
              // Frequency Options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectFrequency('Weekly'),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8.0),
                          color: _selectedFrequency == 'Weekly'
                              ? Colors.blue[100]
                              : Colors.white,
                        ),
                        child: Center(
                            child: const Text(
                          'Weekly',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectFrequency('Monthly'),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8.0),
                          color: _selectedFrequency == 'Monthly'
                              ? Colors.blue[100]
                              : Colors.white,
                        ),
                        child: Center(
                            child: const Text(
                          'Monthly',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
