import 'dart:convert';
import 'dart:developer';

import 'package:my_customers/customers/customer.dart';
import 'package:http/http.dart' as http;

class CustomerRepository {
  String jsn =
      '{"id":3,"firstName":"Another","lastName":"Doe","phoneNumber":"55555555"}';
  Future<List<Customer>> getAllCustomers() async {
    try {
      var url = Uri.parse("http://localhost:8080/api/v1/customers/");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        log("Status ok'");
        log(response.body);
        Iterable clistiterablejson = jsonDecode(response.body);
        List<Customer> clist = List<Customer>.from(
            clistiterablejson.map((data) => Customer.fromJson(data)));
        //.toList();
        log(clist.length.toString());
        return clist;
      }
    } catch (e) {
      log("Error: $e");
    }
    return Future.value([]);
  }

  Future<Customer> getCustomerByID(int id) {
    return Future.value(Customer());
  }
}
