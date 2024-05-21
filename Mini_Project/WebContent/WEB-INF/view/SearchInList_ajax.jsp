<%@page import="com.stock.model.StockListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String ac_code = (String)session.getAttribute("ac_code");
	
	ArrayList<StockListDTO> searchInList = (ArrayList<StockListDTO>) request.getAttribute("searchInList");
	
	String result = "";
	
	// 제이슨 형태로 구성
	if(!searchInList.isEmpty())
	{
		for (StockListDTO searchIn : searchInList) 
		{
			StringBuffer sb = new StringBuffer();
			
			sb.append("{\"in_code\":\"" + searchIn.getIn_code() + "\"");
			sb.append(",\"pr_code\":\"" + searchIn.getPr_code() + "\"");
			sb.append(",\"pr_name\":\"" + searchIn.getPr_name() + "\"");
			sb.append(",\"in_date\":\"" + searchIn.getIn_date() + "\"");
			sb.append(",\"in_quantity\":\"" + searchIn.getIn_quantity() + "\"");
			sb.append(",\"in_description\":\"" + searchIn.getIn_description() + "\"");
			sb.append(",\"wa_name\":\"" + searchIn.getWa_name() + "\"},");
			
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
