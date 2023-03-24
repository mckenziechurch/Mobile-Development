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
      return _customerRepo.getCustomerByID(id);
    }
}