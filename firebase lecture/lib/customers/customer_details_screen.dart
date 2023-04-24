import 'package:flutter/material.dart';
import 'package:my_customers/customers/customer_controller.dart';

import 'customer.dart';

class CustomerDetailScreen extends StatefulWidget
{
  static final CustomerController _myController = CustomerController();

  const CustomerDetailScreen({super.key});
  @override
  _CustomerDetailScreenState createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {

  void _refreshPage()
  {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final int custid = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Customer Details", textAlign: TextAlign.center)),
      ),
      body: Center( 
        child: Row(
        children: [
          FutureBuilder<Customer>(
          future: CustomerDetailScreen._myController.getCustomerDetails(custid),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading customer details..'));
            } else {
            Customer? cust = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Text("Fisrt Name: ${cust?.first_name??""}"),
                Text("Last Name: ${cust?.last_name??""}"),
                Text("Phone Number: ${cust?.phone_number??""}"),
                const Text("Addresses"),
                for(var addr in cust?.addresses??[] ) Text(addr.toString())
              ],
            );
            }
          })
        ])
      )
    );    

}
}
