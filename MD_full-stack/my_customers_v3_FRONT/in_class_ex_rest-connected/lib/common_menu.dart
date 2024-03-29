
import 'package:flutter/material.dart';

class CommonMenu extends StatelessWidget {
  const CommonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('main Menu'),
            ),
            ListTile(
              title: const Text('Customer List'),
              onTap: () {
                Navigator.pop(context);                
                Navigator.pushNamed(context, '/customers');
              },
            ),
            ListTile(
              title: const Text('Add Customer'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/customer_add');
              },
            ),
          ],
        ),
      );
  }
}