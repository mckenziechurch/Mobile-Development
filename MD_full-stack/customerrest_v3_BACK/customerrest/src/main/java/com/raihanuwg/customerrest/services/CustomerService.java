package com.raihanuwg.customerrest.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.raihanuwg.customerrest.models.Address;
import com.raihanuwg.customerrest.models.Customer;
import com.raihanuwg.customerrest.repositories.CustomerRepo;

@Service
public class CustomerService {
	@Autowired
	private CustomerRepo crepo;
	
	// Method to return the list
	public List<Customer> getAllCustomers()
	{
		return crepo.getAllCustomers();
	}
	
	public Customer getCustomerByID(int id)
	{
	    return crepo.getCustomerByID(id);
	}
	
	public List<Address> getAddresses(int cid) throws Exception
	{
		if(cid > 0)
		{
			return crepo.getAddresses(cid);
		}
		throw new Exception("Customer does not exist.");
	}
	   
	public int addCustomer(Customer c)
	{
		return crepo.addCustomer(c);
	}
	
	public void updateCustomer(Customer c)
	{
		//business logic
		//if the client sends customr information without any addresses, we donot want to lose the previous addresses
		Customer oldCustomer = crepo.getCustomerByID(c.getId());
		ArrayList<Address> addrs = new ArrayList<Address>(oldCustomer.getAdressList());
		if (c.getAdressList() != null && c.getAdressList().size() == 0)
		{
			c.setAdressList(addrs);
		}
		crepo.updateCustomer(c);
	}	
	public Address addAddress(int cid, Address a)
	{
		a.setCustID(cid);
		return crepo.addAddress(a);
	}	
}
