import 'package:flutter/material.dart';
import 'package:my_customers/common_menu.dart';

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
        child: _buildButtonsColumn(context),
      ),
      drawer: const CommonMenu(),
    );
  }

  _buildButtonsColumn(BuildContext context){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Navigate to the customer list page
            Navigator.pushNamed(context, '/customers');
          },
          child: const Text('View Customers'),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to the customer list page
            Navigator.pushNamed(context, '/customer_add');
          },
          child: const Text('Add Customer'),
        ),
      ],
    );  
  }
}