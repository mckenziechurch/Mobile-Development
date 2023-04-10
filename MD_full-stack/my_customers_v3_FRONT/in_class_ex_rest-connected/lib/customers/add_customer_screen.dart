import 'package:flutter/material.dart';
import 'package:my_customers/shared_items/myapp_state.dart';
import 'package:provider/provider.dart';

import 'customer.dart';
import 'customer_controller.dart';

class AddCustomerScreen extends StatefulWidget{
  const AddCustomerScreen({super.key});


  @override
  State<StatefulWidget> createState() {
    return _AddCustomerScreenState();
  }

}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  static final CustomerController _myController = CustomerController();
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _fnController = TextEditingController();
    final TextEditingController _lnController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();

    String successMsg = "";
    

    //focuses
    FocusNode _fnFocusNode = FocusNode();
    FocusNode _lnFocusNode = FocusNode();
    FocusNode _phoneFocusNode = FocusNode();  
    _nextFocus(FocusNode focusNode) {
      FocusScope.of(context).requestFocus(focusNode);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("New Customer", textAlign: TextAlign.center)),
      ),
      body: Center(
        child: _buildUI(context),
      ),
    );
  }

  _buildUI(BuildContext context)
  {

    return Form(
      key: _formKey,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(successMsg),
          _getFirstnameField(),
          _getLastnameField(),
          _getPhoneField(),
          ElevatedButton(
            onPressed: _submitCustomerData,
            child: const Text('Create Data'),
          ),
      ],) 
      );
  }

  _getFirstnameField()
  {
          return TextFormField
          (
            controller: _fnController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            focusNode: _fnFocusNode,
            onFieldSubmitted: (String value) 
            {
              _nextFocus(_lnFocusNode);
            },
            validator: _validateInput,
            decoration: const InputDecoration(hintText: 'First Name', labelText: "First Name"),
        );
  }

  _getLastnameField()
  {
          return TextFormField
          (
            controller: _lnController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            focusNode: _lnFocusNode,
            onFieldSubmitted: (String value) 
            {
              _nextFocus(_phoneFocusNode);
            },
            validator: _validateInput,
            decoration: const InputDecoration(hintText: 'Last Name', labelText: "Last Name"),
        );
  }

  _getPhoneField()
  {
          return TextFormField
          (
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            focusNode: _phoneFocusNode,
            onFieldSubmitted: (String value) 
            {
              _nextFocus(_phoneFocusNode);
            },
            decoration: const InputDecoration(hintText: 'Phone Number', labelText: "Phone Number"),
        );
  }  

  String? _validateInput(String? value) {
      if(value == null || value.trim().isEmpty) {
        return 'Name required!';
      }
      return null;
  }  


  _submitCustomerData() {
    if(_formKey.currentState!.validate())
    {
      Customer c = Customer();
      //call controller to add data 
      c.first_name = _fnController.text;
      c.last_name = _lnController.text;
      c.phone_number = _phoneController.text;
      _myController.addCustomer(c);
      Provider.of<MyAppState>(context, listen: false).customerAdded();
      successMsg = "Customer added successfully";
      _formKey.currentState?.reset();
      setState(() {
        
      });
    }
  }
}