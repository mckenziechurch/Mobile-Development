import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customer.dart';
import 'customer_controller.dart';

class CustomerScreen extends StatefulWidget {
  static final CustomerController _myController = CustomerController();
  const CustomerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  void _refreshCustomerList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text("All Customers", textAlign: TextAlign.center)),
        ),
        body: Center(
            child: Row(children: [
          IconButton(
            icon: const Icon(Icons.refresh), // the refresh button
            onPressed: () async {
              await CustomerScreen._myController.getAllCustomers();
              _refreshCustomerList();
            },
          ),
          _CustomerTable(CustomerScreen._myController,
              _refreshCustomerList) // organizing customer info
        ])));
  }
}

class _CustomerTable extends StatelessWidget {
  // notice that this is stateless, since the entire class is stateful
  final CustomerController _myController;
  final VoidCallback _refreshCustomerList;

  const _CustomerTable(this._myController, this._refreshCustomerList);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Customer>>(
        // async code -> getting api data
        future: _myController.getAllCustomers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading..'));
          } else {
            return DataTable(
                columns: _createCustomerColumns(),
                rows: _createCustomerRows(snapshot.data ?? []));
          }
        });
  }

  _createCustomerColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('First Name')),
      const DataColumn(label: Text('Phone Number')),
      const DataColumn(label: Text('Action')),
    ];
  }

  _createCustomerRows(List<Customer> customerList) {
    return customerList
        .map((customer) => DataRow(cells: [
              DataCell(Text('#${customer.id}')),
              DataCell(Text('#${customer.first_name}')),
              //DataCell(Text('#${customer.last_name}')),
              DataCell(Text('#${customer.phone_number}')),
              DataCell(IconButton(
                icon: const Icon(Icons.details),
                onPressed: () async {
                  await _myController.getCustomerDetails(customer.id);
                  _refreshCustomerList();
                },
              )),
            ]))
        .toList();
  }
}
