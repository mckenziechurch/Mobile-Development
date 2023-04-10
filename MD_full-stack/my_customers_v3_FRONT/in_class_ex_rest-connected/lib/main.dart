import 'package:flutter/material.dart';
import 'package:my_customers/shared_items/myapp_state.dart';
import 'package:provider/provider.dart';

import 'customers/add_customer_screen.dart';
import 'customers/customer_details_screen.dart';
import 'customers/customer_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=>MyAppState(),
      child: const MyApp()
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/customers': (context) => const CustomerScreen(),
        '/customerdetails': (context) => const CustomerDetailScreen(),
        '/customer_add': (context) => AddCustomerScreen(),
      },      
    );
  }
}