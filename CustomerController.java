package com.raihanuwg.customerrest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.raihanuwg.customerrest.models.Address;
import com.raihanuwg.customerrest.models.Customer;
import com.raihanuwg.customerrest.services.CustomerService;

@RestController
@RequestMapping(path = "/api/v1/customers")
public class CustomerController {
	@Autowired
	private CustomerService cservice;
	
	   @GetMapping(path = "/", produces = "application/json")
		public List<Customer> getCustomers()
	    {
		   return cservice.getAllCustomers();
	    }
		   
		@GetMapping(path = "/{cid}",produces = "application/json")
        public Customer getCustomer(@PathVariable(value = "cid") Integer id) 
		{
			return cservice.getCustomerByID(id);
		}
		
		@RequestMapping(value="/", method=RequestMethod.POST, produces = "application/json")
		public Customer addCustomer(@RequestBody Customer cDetails) {
		    int id = cservice.addCustomer(cDetails);
		    return cservice.getCustomerByID(id);
		}
		@GetMapping(path = "/{cid}/addresses",produces = "application/json")
        public List<Address> getCustomerAddresses(@PathVariable(value = "cid") Integer id) 
		{
			try
			{
				return cservice.getAddresses(id);
			}
			catch(Exception e)
			{
				throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
			}
		}
		
		@RequestMapping(value="/{cid}/addresses", method=RequestMethod.POST, produces = "application/json")
		public ResponseEntity<?> addCustomerAddress(@PathVariable(value = "cid") Integer id, @RequestBody Address aDetails) {
		    Address a = cservice.addAddress(id, aDetails);
		    if(a == null)//something went wrong
		    {
		    	return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		    }
		    else
		    {
		    	return new ResponseEntity<>(HttpStatus.OK);
		    }
		}

}
