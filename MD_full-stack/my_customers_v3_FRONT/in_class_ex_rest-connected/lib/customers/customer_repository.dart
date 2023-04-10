import 'dart:convert';
import 'dart:developer';

import 'package:my_customers/customers/customer.dart';
import 'package:http/http.dart' as http;

import 'address.dart';

class CustomerRepository
{
  var HTTPSTATUSCODES= <int, String>{405:"This operation is not supported.",500:"Server encoutered issues.",201:"New resource created",404:"resource does not exist"};
  Future<List<Customer>> getAllCustomers() async {
    try {
      var url = Uri.parse("http://localhost:8080/api/v1/customers/");
      var response = await http.get(url);
      if (response.statusCode == 200) {
          //log("Statu ok'");
          //log(response.body);
          Iterable clistiterablejson = jsonDecode(response.body);
          List<Customer> clist = List<Customer>.from(clistiterablejson
          .map((data) => Customer.fromJson(data)));
          //.toList();
          //log(clist.length.toString());
        return clist;
      }
    } catch (e) {
      log("Error: $e");
    }    
    return [];
  }

  Future<Customer> getCustomerByID(int id) async {
    Customer c = Customer();
    try {
      var url = Uri.parse("http://localhost:8080/api/v1/customers/$id");
      log(url.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
          //log("Customer details Statu ok'");
          //log(response.body);
          c = Customer.fromJson(jsonDecode(response.body));
          return c;
      }
    } catch (e) {
      log("Error: $e");
    }  
    return c;
  }

  Future<String?> deleteCustomerByID(int id) async{
    String msg = "Customer deleted successfully";
    log("In delete - repo");
    try {
      var url = Uri.parse("http://localhost:8080/api/v1/customers/$id");
      //log(url.toString());
      var response = await http.delete(url);
      if (response.statusCode == 200) {
          log("Customer deleted");
          return msg;
      }
      else
      {
        log (response.statusCode.toString());
        return HTTPSTATUSCODES[response.statusCode];
      }
    } catch (e) {
      log("Error: $e");
    }  
    return "Error happened";
  }

  Future<Customer> addCustomer(Customer c) async {
    //log("Customer data for adding: ");
    //add some dummy address
    Address a1 = Address(0,"apt 44","some str","anycity","GA","30331","BILLING");
    Address a2 = Address(0,"apt 44","some str","anycity","GA","30331","BILLING");
    c.addresses?.add(a1);
    c.addresses?.add(a2);
    //log(c.toJson().toString());
    final response = await http.post(
      Uri.parse('http://localhost:8080/api/v1/customers/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(c.toJson()),
    );
    //log("Response: $response.body");
    return Customer.fromJson(jsonDecode(response.body));
  }
}