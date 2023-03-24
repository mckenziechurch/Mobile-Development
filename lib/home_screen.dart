import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});
  static const String mytitle = "My Customers";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(mytitle, textAlign: TextAlign.center)),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the customer list page
            Navigator.pushNamed(context, '/customers');
          },
          child: const Text('View Customers'),
        ),
      ),
    );
  }

}