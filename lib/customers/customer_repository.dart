import 'dart:convert';
import 'dart:developer';

import 'package:my_customers/customers/customer.dart';
import 'package:http/http.dart' as http;

class CustomerRepository
{
  String jsn= '{"id":3,"firstName":"Another","lastName":"Doe","phoneNumber":"55555555"}';
  Future<List<Customer>> getAllCustomers() async {
    try {
      var url = Uri.parse("http://localhost:8080/api/v1/customers/");
      var response = await http.get(url);
      if (response.statusCode == 200) {
          log("Statu ok'");
          log(response.body);
          Iterable clistiterablejson = jsonDecode(response.body);
          List<Customer> clist = List<Customer>.from(clistiterablejson
          .map((data) => Customer.fromJson(data)));
          //.toList();
          log(clist.length.toString());
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
          log("Customer details Statu ok'");
          log(response.body);
          c = Customer.fromJson(jsonDecode(response.body));
          return c;
      }
    } catch (e) {
      log("Error: $e");
    }  
    return c;
  }

  Future<String> deleteCustomerByID(int id) async{
    String msg = "Customer deleted successfully";
    log("In delete - repo");
    try {
      var url = Uri.parse("http://localhost:8080/api/v1/customers/$id");
      log(url.toString());
      var response = await http.delete(url);
      if (response.statusCode == 200) {
          log("Customer deleted");
          return msg;
      }
    } catch (e) {
      log("Error: $e");
    }  
    return "Error happened";
  }



}