package com.mindtree.Service;



import java.util.List;

import com.mindtree.Service.Entity.Contact;


public interface ContactService {
	
	public boolean addContact(Contact contact);

	public List<Contact> getAllContacts();

}
