package com.mindtree.DAO;

import java.util.List;

import com.mindtree.Service.Entity.Contact;

public interface ContactDAO {

	public boolean addContact(Contact contact);

	public List<Contact> getAllContacts();

}
