package com.mindtree.Controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mindtree.Service.Entity.Contact;
import com.mindtree.Service.ContactService;

@Controller
public class ContactController {
	
	@Autowired
	public ContactService contactService;
	
	@RequestMapping(value="AddContactController.view", method=RequestMethod.GET)
	public String getAddContactPage(Model model){
		Contact contact=new Contact();
		model.addAttribute("contact",contact);
		return "AddContact";
	}
	
	@RequestMapping("AddContacts.view")
	public String addContact(@ModelAttribute("contact") Contact contact,Model model){
		boolean isContactAdded=contactService.addContact(contact);
		if(isContactAdded){
			model.addAttribute("status","Contact has been added");
			return "AddContact";
		}
		else{
			model.addAttribute("status","Contact has not been added");
			return "AddContact";
		}
	}
}
