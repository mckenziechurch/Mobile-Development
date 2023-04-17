import 'package:flutter_test/flutter_test.dart';
import 'package:my_customers/customers/customer.dart';

void main()
{
  group
  ('Customer',()
    {
      test("customer from valid json - no address",
        ()
        {
          Customer c = Customer.fromJson({"id":3,"firstName":"Another","lastName":"Doe","phoneNumber":"55555555","adressList":[]});
          //Customer c = Customer.fromJson({"lastName":"Doe","phoneNumber":"55555555","adressList":[]});
          expect(c.first_name,"Another");
          expect(c.last_name, "Doe");
        }
      );

      test("Invalid json data", () 
        {
          expect(()=>Customer.fromJson({"lastName":"Doe","phoneNumber":"55555555","adressList":[]}), throwsA(isA<FormatException>()));
        }
      );

      test("customer from valid json - with address",
        ()
        {
          Customer c = Customer.fromJson({"id":2,"firstName":"Jane","lastName":"Doe","phoneNumber":"3336464646","adressList":[{"id":0,"aptOrHouseNo":"A5","streetName":"Cascade","city":"Atlanta","state":"GA","zip":"356343","addressType":"BILLING","custID":1},{"id":0,"aptOrHouseNo":"A5","streetName":"Cascade","city":"Atlanta","state":"GA","zip":"356343","addressType":"SHIPPING","custID":1}]});
          expect(c.first_name,"Jane");
          expect(c.addresses?.length, 2);      
        }
      );      
    }
  );
}