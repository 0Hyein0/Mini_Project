package com.stock.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stock.model.IStockListDAO;
import com.stock.model.StockListDTO;

@Controller
public class StockListController
{
	@Autowired
	private SqlSession sqlsession;

	// 전체 재고 조회
	@RequestMapping(value="/stocklist.do", method=RequestMethod.GET)
	public String stockList(HttpServletRequest request, ModelMap model) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		
		model.addAttribute("stockList", dao.stockList(ac_code));
		model.addAttribute("waList", dao.waList(ac_code));
		model.addAttribute("prList", dao.inPrList(ac_code));
		
		return "/WEB-INF/view/StockList.jsp";		
	}
	
	// 입고 내역 조회
	@RequestMapping(value="/inlist.do", method=RequestMethod.GET)
	public String inList(HttpServletRequest request, ModelMap model) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		
		model.addAttribute("inList", dao.inList(ac_code));
		model.addAttribute("waList", dao.waList(ac_code));
		model.addAttribute("prList", dao.inPrList(ac_code));
		
		return "/WEB-INF/view/InList.jsp";		
		
	}
	
	// 출고 내역 조회
	@RequestMapping(value="/outlist.do", method=RequestMethod.GET)
	public String outList(HttpServletRequest request, ModelMap model) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		
		model.addAttribute("outList", dao.outList(ac_code));
		model.addAttribute("waList", dao.waList(ac_code));
		model.addAttribute("prList", dao.outPrList(ac_code));
		
		return "/WEB-INF/view/OutList.jsp";		
	}
	
	// 전체 재고 검색
	@RequestMapping(value="/searchstocklist.do", method=RequestMethod.GET)
	public String searchStockList(HttpServletRequest request, ModelMap model
			,@Param("pr_code")String pr_code, @Param("wa_code")String wa_code
			,@Param("search_date")String search_date) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		ArrayList<StockListDTO> searchStockList = dao.searchStockList(ac_code, pr_code, wa_code, search_date);
		
		model.addAttribute("searchStockList", searchStockList);
		
		return "/WEB-INF/view/SearchStockList_ajax.jsp";		
	}
	
	// 입고 내역 검색
	@RequestMapping(value="/searchinlist.do", method=RequestMethod.GET)
	public String searchInList(HttpServletRequest request, ModelMap model
			,@Param("pr_code")String pr_code, @Param("wa_code")String wa_code
			,@Param("start_date")String start_date, @Param("end_date")String end_date) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		ArrayList<StockListDTO> searchInList = dao.searchInList(ac_code, pr_code, wa_code, start_date, end_date);
		
		
		model.addAttribute("searchInList", searchInList);
		
		return "/WEB-INF/view/SearchInList_ajax.jsp";		
	}
	
	// 출고 내역 검색
	@RequestMapping(value="/searchoutlist.do", method=RequestMethod.GET)
	public String searchOutList(HttpServletRequest request, ModelMap model
			,@Param("pr_code")String pr_code, @Param("wa_code")String wa_code
			,@Param("start_date")String start_date, @Param("end_date")String end_date) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		ArrayList<StockListDTO> searchOutList = dao.searchOutList(ac_code, pr_code, wa_code, start_date, end_date);
		
		model.addAttribute("searchOutList", searchOutList);
		
		return "/WEB-INF/view/SearchOutList_ajax.jsp";		
	}
	
	// 입고 내역 디테일 조회
	@RequestMapping(value="/inlistdetail.do", method=RequestMethod.GET)
	public String inListDetail(ModelMap model, String in_code)
	{
		IStockListDAO dao = sqlsession.getMapper(IStockListDAO.class);
		ArrayList<StockListDTO> inListDetail = dao.inListDetail(in_code);
		
		model.addAttribute("inListDetail", inListDetail);
				
		return "/WEB-INF/view/InListDetail.jsp";
	}
	
	
}