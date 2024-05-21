<%@page import="com.stock.model.StockListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String ac_code = (String)session.getAttribute("ac_code");
	
	ArrayList<StockListDTO> searchStockList = (ArrayList<StockListDTO>) request.getAttribute("searchStockList");
	
	String result = "";
	
	// 제이슨 형태로 구성
	if(!searchStockList.isEmpty())
	{
		for (StockListDTO searchStock : searchStockList) 
		{
			StringBuffer sb = new StringBuffer();
			
			sb.append("{\"pr_code\":\"" + searchStock.getPr_code() + "\"");
			sb.append(",\"pr_name\":\"" + searchStock.getPr_name() + "\"");
			sb.append(",\"total_in\":\"" + searchStock.getTotal_in() + "\"");
			sb.append(",\"total_out\":\"" + searchStock.getTotal_out() + "\"},");
			result += sb.toString();
		}
			
		// 마지막 컴마 제거
		result = result.substring(0, result.length()-1);
		
		// JSON 배열 객체 구성
		result = "[" + result + "]";
	}
	else
		result="[]";
	
	out.println(result);
%>
