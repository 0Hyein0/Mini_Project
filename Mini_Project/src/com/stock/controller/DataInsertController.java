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

import com.stock.model.IDataInsertDAO;
import com.stock.model.StockListDTO;

@Controller
public class DataInsertController
{
	@Autowired
	private SqlSession sqlsession;
	
	// 재고 조회
	@RequestMapping(value="/indatainsert.do", method=RequestMethod.GET)
	public String stockList(StockListDTO dto
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
	public String stockList(HttpServletRequest request, ModelMap model, @Param("pr_code")String pr_code) 
	{
		HttpSession session = request.getSession();
		String ac_code = (String)session.getAttribute("ac_code");
		
		IDataInsertDAO dao = sqlsession.getMapper(IDataInsertDAO.class);
		ArrayList<StockListDTO> warehouseList = dao.waList(pr_code, ac_code);
		
		model.addAttribute("warehouseList", warehouseList);
		
		return "/WEB-INF/view/WareHouseList_ajax.jsp";
	}
	
}