package com.raihanuwg.customerrest.storage;

import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.ArrayList;

import com.raihanuwg.customerrest.models.Address;
import com.raihanuwg.customerrest.models.Customer;

/**
 * 
 * @author rahmed
 * This class simulates a database engine - stores data in memory
 */
public class CustomerStorage {
	
	Dictionary<Integer,Customer> customers = new Hashtable<>();
	
	public List<Customer> getCustomers() {
		List<Customer> allCust = new ArrayList<>();
        Enumeration<Integer> e = customers.keys();
        while(e.hasMoreElements()) {
            Integer k = e.nextElement();
            allCust.add(customers.get(k));
        }
        return allCust;
	}

	public int add(Customer c)
	{
		int newID = customers.size() + 1;
		c.setId(newID);
		customers.put(c.getId(), c);
		//now update the addresses of each customer with customer ID
		for(Address a:c.getAdressList())
		{
			a.setCustID(newID);
		}
		return c.getId();
	}
	
	public Customer getCustomer(int id)
	{
		return customers.get(id);
	}
	
	public List<Address> getAddresses(int id)
	{
		return customers.get(id).getAdressList();
	}
	
	public Address addAddress(Address a)
	{
		Customer c = customers.get(a.getCustID());
		int aid = c.getAdressList().size() + 1;
		a.setId(aid);
		c.getAdressList().add(a);
		return a;
	}
	
	public void updateCustomer(Customer c)
	{
		customers.remove(c.getId());
		customers.put(c.getId(), c);
	}

}
