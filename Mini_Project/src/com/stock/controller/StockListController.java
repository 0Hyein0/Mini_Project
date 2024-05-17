package com.stock.controller;

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
	public String stockList(ModelMap model) 
	{
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		
		model.addAttribute("stockList", dao.stockList());
		
		return "/WEB-INF/view/StockList.jsp";		
	}
}