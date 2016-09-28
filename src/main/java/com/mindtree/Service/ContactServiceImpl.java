package com.mindtree.Service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mindtree.DAO.ContactDAO;
import com.mindtree.Service.Entity.Contact;

@Service
public class ContactServiceImpl implements ContactService{
	
	@Autowired
	public ContactDAO contactDAO;
	
	@Transactional
	public boolean addContact(Contact contact) {
		boolean isContactAdded=false;
		isContactAdded=contactDAO.addContact(contact);
		return isContactAdded;
		
		
	}

	public List<Contact> getAllContacts() {
		List<Contact> contactList=new ArrayList<Contact>();
		contactList=contactDAO.getAllContacts();
		return contactList;
	}

}
