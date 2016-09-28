package com.mindtree.Util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
		public SessionFactory getSessionFactory(){
			Configuration configuration=new Configuration().configure();
			
			SessionFactory sessionFactory=configuration.buildSessionFactory();
		
		return sessionFactory;
		}
}
