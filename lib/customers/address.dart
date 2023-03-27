class Address
{
    String id = "0";
    String aptOrHouseNo = "";
    String streetName = "";
    String city = "";
    String state = "";
    String zip = "";
    String addressType = "";
    int custID = 1;

    Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aptOrHouseNo = json['aptOrHouseNo'];
    streetName = json['streetName'];
    city = json['city'];
    state = json['state'];
    zip = json['phoneNumber'];
    addressType = json['addressType'];
    custID = json['custID'];
    }
}