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
public class StockListController
{
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping(value="/stocklist.do", method=RequestMethod.GET)
	public String stockList(HttpServletRequest request, ModelMap model) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		
		model.addAttribute("stockList", dao.stockList(ac_code));
		
		return "/WEB-INF/view/StockList.jsp";		
	}
	
	@RequestMapping(value="/inlist.do", method=RequestMethod.GET)
	public String inList(HttpServletRequest request, ModelMap model) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		
		model.addAttribute("inList", dao.inList(ac_code));
		
		return "/WEB-INF/view/InList.jsp";		
	}
	
	@RequestMapping(value="/outlist.do", method=RequestMethod.GET)
	public String outList(HttpServletRequest request, ModelMap model) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		
		model.addAttribute("outList", dao.outList(ac_code));
		
		return "/WEB-INF/view/OutList.jsp";		
	}
	
	
}