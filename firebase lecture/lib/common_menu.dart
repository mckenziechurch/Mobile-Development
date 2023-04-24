
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_customers/auth_gate.dart';

class CommonMenu extends StatelessWidget {
  CommonMenu({super.key});
  final FirebaseAuth athenticator = FirebaseAuth.instance;

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
            getSignOutMenu(context)
          ],
        ),
      );
  }
  
  ListTile getSignOutMenu(BuildContext context) {
    if(athenticator.currentUser != null)
    {
      return ListTile(
              title: const Text('Sign out'),
              onTap: () {
                signOut(context);
              },
            );
    }
    return ListTile(
              title: const Text(''),
              onTap: () {
                
              },
            );
  }
  
  void signOut(BuildContext context) async{
    await athenticator.signOut();
    // ignore: use_build_context_synchronously
    if(!context.mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const AuthGate()));
  }
}