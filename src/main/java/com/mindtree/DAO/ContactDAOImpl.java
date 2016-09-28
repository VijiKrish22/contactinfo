package com.mindtree.DAO;



import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.mindtree.Service.Entity.Contact;
import com.mindtree.Util.HibernateUtil;

@Repository
public class ContactDAOImpl implements ContactDAO{

	HibernateUtil hibernateUtil=new HibernateUtil();
	public boolean addContact(Contact contact) {
		Transaction transaction = null;
		SessionFactory sessionFactory=hibernateUtil.getSessionFactory();
		Session session=sessionFactory.openSession();
		int temp=0;
		try{
			transaction=session.beginTransaction();
			temp=(Integer) session.save(contact);
			transaction.commit();
		}catch(HibernateException he){
			System.out.println("Hibernate Exception");
		}
		finally {
			session.close();
		}
		if(temp>0){
			return true;
		}
		return false;
	}
	
	public List<Contact> getAllContacts() {
		List<Contact> contactList=new ArrayList<Contact>();
		
		SessionFactory sessionFactory=hibernateUtil.getSessionFactory();
		Session session=sessionFactory.openSession();
		try{
			contactList=session.createQuery("FROM Contact").list();
			System.out.println("size="+contactList.size());
			for (Contact contact : contactList) {
				System.out.println(contact);
			}
		}catch(HibernateException he){
			System.out.println("Hibernate Exception");
		}
		finally {
			session.close();
		}	
		return contactList;
	}

}
