package com.raihanuwg.customerrest.models;

import java.util.ArrayList;
import java.util.List;

public class Customer {
	public Customer()
	{
		
	}
	public Customer(int id, String firstName, String lastName, String phoneNumber, List<Address> adressList) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		if(adressList != null)
		{
			this.adressList = adressList;
		}
	}
	public Customer(String firstName, String lastName, String phoneNumber, List<Address> adressList) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.adressList = adressList;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public List<Address> getAdressList() {
		return adressList;
	}
	public void setAdressList(ArrayList<Address> adressList) {
		this.adressList = adressList;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	int id;
	String firstName; 
	String lastName;
	String phoneNumber;
	List<Address> adressList = new ArrayList<Address>();

}
