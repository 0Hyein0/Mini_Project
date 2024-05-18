package com.stock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stock.model.IStockListDAO;

@Controller
public class InListController
{
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping(value="/inlist.do", method=RequestMethod.GET)
	public String stockList(HttpServletRequest request, ModelMap model) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		
		model.addAttribute("inList", dao.inList(ac_code));
		
		return "/WEB-INF/view/InList.jsp";		
	}
}