//Customer model
import 'dart:developer';

import 'address.dart';

class Customer{
  int id = 0;
  String first_name = "";
  String last_name = "";
  String phone_number = "";
  List<Address>? addresses;
  Customer();

    Customer.fromJson(Map<String, dynamic> json) {
    //  log("json -> $json");
    id = json['id'];
    log("json id -> $id");
    first_name = json['firstName'];
    log("json first name -> $first_name");
    last_name = json['lastName'];
    //log("json -> $json");
    phone_number = json['phoneNumber'];
  }
}