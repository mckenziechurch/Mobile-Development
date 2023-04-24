import 'dart:developer';

import 'customer.dart';
import 'customer_repository.dart';
import 'package:http/http.dart' as http;

class CustomerController 
{
    CustomerController();
    final CustomerRepository _customerRepo = CustomerRepository();

    Future<List<Customer>> getAllCustomers() {
      return _customerRepo.getAllCustomers();
    }

    Future<Customer> getCustomerDetails(int id) {
      log("Customer ID passed: $id");
      return _customerRepo.getCustomerByID(http.Client(),id);
    }

    Future<String?> deleteCust(int id) {
      log("Customer ID passed in delete: $id");
      return _customerRepo.deleteCustomerByID(id);
    }

  Future<Customer> addCustomer(Customer c) {
    return _customerRepo.addCustomer(c);
  }
}