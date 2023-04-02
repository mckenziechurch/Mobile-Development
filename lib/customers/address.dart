import 'dart:developer';

class Address
{
    int id = 0;
    String aptOrHouseNo = "";
    String streetName = "";
    String city = "";
    String state = "";
    String zip = "";
    String addressType = "";
    int custID = 1;

    Address.fromJson(Map<String, dynamic> json) 
    {
      id = json['id'];
      log("Address ID $id");
      aptOrHouseNo = json['aptOrHouseNo'];
      log("House $aptOrHouseNo");
      streetName = json['streetName'];
      log("Street ID $streetName");
      city = json['city'];
      log("City $city");
      state = json['state'];
      log("State $state");
      zip = json['zip'];
      log("Phone $id");
      addressType = json['addressType'];
      log("Address ID $id");
      custID = json['custID'];
      log("Address ID $id");
    }

    @override
    String toString()
    {
      return "House $aptOrHouseNo Street ID $streetName City $city State $state Zip $zip Address Type $addressType";
    }

}