import 'dart:convert';

import 'package:my_customers/customers/customer.dart';
import 'package:http/http.dart' as http;

class CustomerRepository
{
  Future<List<Customer>> getAllCustomers() async {
    try {
      var url = Uri.parse("http://localhost:8080/api/v1/customers/");
      var response = await http.get(url);
      if (response.statusCode == 200) {
          List<Customer> clist = json.decode(response.body)['results']
          .map((data) => Customer.fromJson(data))
          .toList();
        return clist;
      }
    } catch (e) {
      //
    }    
    return Future.value([]);
  }

  Future<Customer> getCustomerByID(int id) {
    return Future.value(Customer());
  }



}