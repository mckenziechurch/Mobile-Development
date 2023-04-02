import 'dart:developer';

import 'customer.dart';
import 'customer_repository.dart';

class CustomerController 
{
    CustomerController();
    final CustomerRepository _customerRepo = CustomerRepository();

    Future<List<Customer>> getAllCustomers() {
      return _customerRepo.getAllCustomers();
    }

    Future<Customer> getCustomerDetails(int id) {
      log("Customer ID passed: $id");
      return _customerRepo.getCustomerByID(id);
    }

    Future<String> deleteCust(int id) {
      log("Customer ID passed in delete: $id");
      return _customerRepo.deleteCustomerByID(id);
    }
}