//Customer model
import 'dart:convert';
import 'dart:developer';

import 'address.dart';

class Customer {
  int id = 0;
  String first_name = "";
  String last_name = "";
  String phone_number = "";
  List<Address>? addresses = [];
  Customer();

  Customer.fromJson(Map<String, dynamic> json) {
    try {
      // TRY-CATCH BLOCK FOR ERROR HANDLING IN TESTING
      //  log("json -> $json");
      id = json['id'];
      // log("json id -> $id");
      first_name = json['firstName'];
      //log("json first name -> $first_name");
      last_name = json['lastName'];
      //log("json -> $json");
      phone_number = json['phoneNumber'];
      if (json['addressList'] != null && json['adressList'].length > 0) {
        //log("address asey $json");
        //var addressObjectJson = json['adressList'] as List;
        Iterable addressObjectJson = jsonDecode(jsonEncode(json['adressList']));
        //log(addressObjectJson.toString());
        addresses = List<Address>.from(
            addressObjectJson.map((addrJson) => Address.fromJson(addrJson)));
      }
      //log("Address List in customr");
      //log(addresses?[0].aptOrHouseNo??"");
    } catch (e) {
      throw const FormatException('Customer JSON is invalid.');
    }
  }

  Map<String, dynamic> toJson() => {
        'firstName': first_name,
        'lastName': last_name,
        'phoneNumber': phone_number,
        'adressList': addresses
      };
}
