import 'package:flutter_test/flutter_test.dart';
import 'package:my_customers/customers/customer.dart';

void main() {
  group('Customer Tests', () {
    // GROUP SIMILAR TESTS TOGETHER
    test('Test Customer w No Addresses', () {
      Customer testCust = Customer.fromJson({
        // GRAB A DUMMY JSON STRING
        "id": 0,
        "first_name": "John",
        "last_name": "Doe",
        "phone_number": "9999999999",
        "addressList": []
      });
      expect(testCust.first_name, 'JohnDoe');
      expect(testCust.last_name, '');
    });

    test('Test Customer w Addresses', () {
      Customer testCust = Customer.fromJson({
        "id": 0,
        "first_name": "John",
        "last_name": "Doe",
        "phone_number": "9999999999",
        "addressList": []
      });
      expect(testCust.first_name, "John");
      expect(testCust.addresses?.length, 1);
    });

    test('Throw Exception w Invalid JSON', () {
      Customer testCust = Customer.fromJson({
        "first_name":
            "John", // WE HAVE OMMITTED THE ID TO TRIGGER AN ERROR FROM THE TRY-CATCH BLOCK IN customer.fromJson()
        "last_name": "Doe",
        "phone_number": "9999999999",
        "addressList": []
      });
      expect(testCust.id, throwsA(isA<FormatException>()));
      expect(testCust.addresses?.length, 1);
    });
  });
}
