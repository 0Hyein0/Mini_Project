package com.stock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainPageController
{

	@RequestMapping(value="/stock.do", method=RequestMethod.GET)
	public String mainPage(Model model) 
	{
		return "/WEB-INF/view/Login.jsp";		
	}
}