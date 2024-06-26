package com.stock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	@RequestMapping(value="/stock.do", method=RequestMethod.POST)
	public String stockList(HttpServletRequest request, ModelMap model, @Param("ac_code")String ac_code, @Param("ac_pw")String ac_pw) 
	{
		IAccountDAO dao = sqlsession.getMapper(IAccountDAO.class);
		
		String userCode = dao.login(ac_code, ac_pw);
		String userName = dao.acName(ac_code);
				
		String url = "";
		
		if(userCode != null && userCode != "")
		{
			HttpSession session = request.getSession();
			
			session.setAttribute("ac_code", userCode);
			session.setAttribute("ac_name", userName);
			url = "/WEB-INF/view/StockList.jsp";
		}
		else
			url = "redirect:login.do";
			
		return url;
	}
}