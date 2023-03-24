//Customer model
class Customer{
  int id = 0;
  String first_name = "";
  String last_name = "";
  String phone_number = "";
  Customer();

    Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['frst_name'];
    last_name = json['last_name'];
    phone_number = json['phone_number'];
  }
}