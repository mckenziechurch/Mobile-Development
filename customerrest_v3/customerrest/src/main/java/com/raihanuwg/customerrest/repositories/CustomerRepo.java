package com.raihanuwg.customerrest.repositories;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.raihanuwg.customerrest.models.Address;
import com.raihanuwg.customerrest.models.Customer;
import com.raihanuwg.customerrest.storage.CustomerStorage;

@Repository
public class CustomerRepo {
	public static CustomerStorage cs = new CustomerStorage();
	
	//a static block to add some default data
	static
	{
		Address a1 = new Address("A5", "Cascade", "Atlanta", "GA","356343", "BILLING");
		Address a2 = new Address("A5", "Cascade", "Atlanta","GA","356343", "SHIPPING");
		List<Address> addrlist = new ArrayList<>();
		addrlist.add(a1);
		addrlist.add(a2);
		cs.add(new Customer("John", "Doe", "4646464646", addrlist));
		cs.add(new Customer("Jane", "Doe", "3336464646", addrlist));
		cs.add(new Customer("Another", "Doe", "55555555", new ArrayList<Address>()));
	}
	
	// Method to return the list
	public List<Customer> getAllCustomers()
	{
		return cs.getCustomers();
	}
	
	public Customer getCustomerByID(int id)
	{
	    return cs.getCustomer(id);
	}
	
	public List<Address> getAddresses(int cid)
	{
		return cs.getCustomer(cid).getAdressList();
	}
	   
	public int addCustomer(Customer c)
	{
		return cs.add(c);
	}
	
	public void updateCustomer(Customer c)
	{
		cs.updateCustomer(c);
	}	
	
	public Address addAddress(Address a)
	{
		return cs.addAddress(a);
	}
	
}
