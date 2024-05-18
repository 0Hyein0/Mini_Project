package com.stock.controller;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stock.model.IAccountDAO;

@Controller
public class AccountController
{
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String stockList(ModelMap model, @Param("ac_code")String ac_code, @Param("ac_pw")String ac_pw) 
	{
		IAccountDAO dao = sqlsession.getMapper(IAccountDAO.class);
		
		String userName = dao.login(ac_code, ac_pw);
		String url = "";
		
		System.out.println(userName);
		
		if(userName != null)
			url = "/WEB-INF/view/MainPage.jsp";
		else
			url = "redirect:stock.jsp";
			
		return url;
		
	}
}