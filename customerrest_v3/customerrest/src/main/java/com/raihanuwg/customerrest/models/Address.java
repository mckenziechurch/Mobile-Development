package com.raihanuwg.customerrest.models;

public class Address {
	public Address()
	{
		
	}
	public Address(int id, String aptOrHouseNo, String streetName, String city, String state, String zip,
			String addressType, int custID) {
		super();
		this.id = id;
		this.aptOrHouseNo = aptOrHouseNo;
		this.streetName = streetName;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.addressType = addressType;
		this.custID = custID;
	}
	public Address(String aptOrHouseNo, String streetName, String city, String state, String zip,
			String addressType) {
		super();
		this.aptOrHouseNo = aptOrHouseNo;
		this.streetName = streetName;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.addressType = addressType;
	}	
	public String getAptOrHouseNo() {
		return aptOrHouseNo;
	}
	public void setAptOrHouseNo(String aptOrHouseNo) {
		this.aptOrHouseNo = aptOrHouseNo;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddressType() {
		return addressType;
	}
	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustID() {
		return custID;
	}
	//why the check here?
	public void setCustID(int custID) {
		if(this.custID == 0)
		{
			this.custID = custID;
		}
	}
	
	int id;
	String aptOrHouseNo;
	String streetName;
	String city;
	String state;
	String zip;
	String addressType; //can be SHIPPING or BILLINHG (should use enum)
	int custID;
}
