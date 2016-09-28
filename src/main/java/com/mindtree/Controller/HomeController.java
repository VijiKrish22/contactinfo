package com.mindtree.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("HomeController.view")
	public String getHomePage(){
		return "HomePage";
	}
}
