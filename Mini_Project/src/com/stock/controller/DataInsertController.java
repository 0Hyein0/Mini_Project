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
import org.springframework.web.bind.annotation.RequestParam;

import com.stock.model.IDataInsertDAO;
import com.stock.model.StockListDTO;

@Controller
public class DataInsertController
{
	@Autowired
	private SqlSession sqlsession;
	
	// 입고 등록
	@RequestMapping(value="/indatainsert.do", method=RequestMethod.GET)
	public String inAdd(StockListDTO dto
			, @Param("pr_code") String pr_code, @Param("wa_code")String wa_code
			, @Param("in_quantity")Integer in_quantity, @Param("in_date")String in_date
			, @Param("in_description")String in_description) 
	{
		
		IDataInsertDAO dao = sqlsession.getMapper(IDataInsertDAO.class);
		
		dao.inAdd(dto);
		
		return "redirect:inlist.do";
	}
	
	
	// 출고 제품별 출고 가능한 창고 조회
	@RequestMapping(value="/warehouselist.do", method=RequestMethod.GET)
	public String waList(HttpServletRequest request, ModelMap model, @RequestParam("pr_code")String pr_code, @RequestParam("ac_code")String ac_code) 
	{
		
		IDataInsertDAO dao = sqlsession.getMapper(IDataInsertDAO.class);
		ArrayList<StockListDTO> warehouseList = dao.waList(pr_code, ac_code);
		
		model.addAttribute("warehouseList", warehouseList);
		
		return "/WEB-INF/view/WareHouseList_ajax.jsp";
	}
	
	// 출고 제품, 창고 별 출고 가능한 재고 수량
	@RequestMapping(value="/maxquantity.do", method=RequestMethod.GET)
	public String maxQuantity(HttpServletRequest request, ModelMap model
			, @RequestParam("pr_code")String pr_code, @RequestParam("ac_code")String ac_code, @RequestParam("wa_code")String wa_code) 
	
	{
		IDataInsertDAO dao = sqlsession.getMapper(IDataInsertDAO.class);
		int maxQuantity = dao.maxQuantity(pr_code, ac_code, wa_code);
		
		model.addAttribute("maxQuantity", maxQuantity);
		
		return "/WEB-INF/view/MaxOutQuantity_ajax.jsp";
	}
	
	// 출고 등록
	@RequestMapping(value="/outdatainsert.do", method=RequestMethod.GET)
	public String outAdd(StockListDTO dto
			, @Param("pr_code") String pr_code, @Param("wa_code")String wa_code
			, @Param("out_quantity")Integer in_quantity, @Param("out_date")String in_date
			, @Param("out_description")String in_description) 
	{
		
		IDataInsertDAO dao = sqlsession.getMapper(IDataInsertDAO.class);
		
		dao.outAdd(dto);
		
		return "redirect:outlist.do";
	}
	
	// 제품 등록
	@RequestMapping(value="/productinsert.do", method=RequestMethod.GET)
	public String productAdd(HttpServletRequest request, @Param("pr_name")String inputPrName
			, @Param("pr_description")String inputPrDescription, @Param("pr_code") String inputPrCode) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IDataInsertDAO dao = sqlsession.getMapper(IDataInsertDAO.class);
		
		dao.productAdd(inputPrCode, inputPrName, inputPrDescription, ac_code);
		
		return "redirect:stocklist.do";
	}
	
}