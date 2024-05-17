package com.stock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/*
public class MainPageController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/WEB-INF/view/MainPage.jsp");
		
		return mav;
	}
}
;
*/

@Controller
public class MainPageController
{

	@RequestMapping(value="/stock.do", method=RequestMethod.GET)
	public String mainPage(Model model) 
	{
		return "/WEB-INF/view/MainPage.jsp";		
	}
}