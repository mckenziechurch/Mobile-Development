import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_customers/shared_items/myapp_state.dart';
import '../common_menu.dart';
import 'customer.dart';
import 'customer_controller.dart';

class CustomerScreen extends StatefulWidget
{
  static final CustomerController _myController = CustomerController();
  const CustomerScreen({super.key});

  @override
    // ignore: library_private_types_in_public_api
    _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen>{
  String _newcustomermsg = "";
  void _refreshCustomerList()
  {
    Provider.of<MyAppState>(context, listen: false).clearCustomerAction();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("All Customers", textAlign: TextAlign.center)),
      ),
      body: Column( 
        children: [
          _getNewCustomerNotificationText(),
          Row(
          children: [
            IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () async {
                    await CustomerScreen._myController.getAllCustomers();
                    _refreshCustomerList();
                  },
                ),
            _CustomerTable(CustomerScreen._myController, _refreshCustomerList)
          ])
      ])
    );
  }

_getNewCustomerNotificationText()
{
  //use - Provider.of<CartModel>(context, listen: false).methdName();
  //when we do not need to change the UI, butonly neeed to have access to data or call a method.
  return Consumer<MyAppState>(
  builder: (context, mystate, child) {
    String msg = mystate.getCustomerAction();
    if(msg.isNotEmpty)
    {
      msg = 'Customer $msg.  Tap on Refresh button to get fresh list.';
    }
    return Text(msg);
  },
);
}
}



class _CustomerTable extends StatelessWidget{
  final CustomerController _myController;
  final VoidCallback _refreshCustomerList;
  
  const _CustomerTable(this._myController, this._refreshCustomerList);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Customer>>(
        future: _myController.getAllCustomers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading..'));
          } else {
            return Scrollbar(
            child: DataTable(
                columns: _createCustomerColumns(),
                rows: _createCustomerRows(snapshot.data ?? [],context))
                );
          }
        });
    
  }
  
  _createCustomerColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('First Name')),
      const DataColumn(label: Text('Phone Number')),
      const DataColumn(label: Text('Action')),];
  }

  _createCustomerRows(List<Customer> customerList,BuildContext context) {
    return customerList
        .map((customer) => DataRow(cells: [
              DataCell(Text('#${customer.id}')),
              DataCell(Text('#${customer.first_name}')),
              //DataCell(Text('#${customer.last_name}')),
              DataCell(Text('#${customer.phone_number}')),
              DataCell(ButtonBar(
                mainAxisSize: MainAxisSize.min, // this will take space as minimum as posible(to center)
                children: [
                  ElevatedButton(
                    onPressed: (){_showaddresses(context, customer);},
                    child: const Text('Addresses'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/customerdetails', arguments: customer.id);
                    },
                    child: const Text('Customer Details'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      _deleteCstomer(customer.id);
                      _refreshCustomerList();
                    },
                    child: const Text('Delete'),
                  ),                  
                ],
              ),),
            ]))
        .toList();
  }

  _showaddresses(BuildContext context, Customer cust){
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Text(cust.first_name),
            for(var addr in cust.addresses??[] ) Text(addr.toString())
          ],
        );
      });
  }

  _deleteCstomer(int custID) async
  {
    String? msg = await _myController.deleteCust(custID);
    log("Delete message: $msg");
  }
}


