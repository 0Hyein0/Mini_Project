<%@page import="com.stock.model.StockListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String ac_code = (String)session.getAttribute("ac_code");
	
	ArrayList<StockListDTO> warehouseList = (ArrayList<StockListDTO>) request.getAttribute("warehouseList");
	
	String result = "";
	
	// 제이슨 형태로 구성
	if(!warehouseList.isEmpty())
	{
		for (StockListDTO warehouse : warehouseList) 
		{
			StringBuffer sb = new StringBuffer();
			
			sb.append("{\"wa_code\":\"" + warehouse.getWa_code() + "\"");
			sb.append(",\"wa_name\":\"" + warehouse.getWa_name() + "\"},");
			
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
