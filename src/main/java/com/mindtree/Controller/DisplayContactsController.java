package com.mindtree.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.mindtree.Service.Entity.Contact;
import com.mindtree.Service.ContactService;



@Controller
public class DisplayContactsController {
	
	@Autowired
	public ContactService contactService;
	
	@RequestMapping("ViewContactsController.view")
	public String getViewContactsPage(Model model){
		
		List<Contact> contactList=new ArrayList<Contact>();
		contactList=contactService.getAllContacts();
		model.addAttribute("contactList", contactList);
		return "ViewContacts";
	}
}
