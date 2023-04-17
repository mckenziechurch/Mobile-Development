import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'customer_repository_test.mocks.dart';
import 'package:my_customers/customers/customer_repository.dart';
import 'package:my_customers/customers/customer.dart';
@GenerateMocks([http.Client])
void main()
{ 
  CustomerRepository customerRepo = CustomerRepository(); 
  group('getCustomerByID', () {
    test('returns a customer if http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('http://localhost:8080/api/v1/customers/1')))
          .thenAnswer((_) async =>
              http.Response('{"id":3,"firstName":"Another","lastName":"Doe","phoneNumber":"55555555","adressList":[]}', 200));
      Customer c = await customerRepo.getCustomerByID(client,1);
      //expect(await customerRepo.getCustomerByID(client,1), isA<Customer>());
      expect("Another",c.first_name);
    });

    test('throws an exception if the http call completes with an error', () async {
      final client = MockClient();
      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('http://localhost:8080/api/v1/customers/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      //Customer c = await customerRepo.getCustomerByID(client,1);
      //expect(c.first_name,'');
      expect(await customerRepo.getCustomerByID(client,1), throwsException);
      //expect(c.first_name, "Joe");
    });
  });
}