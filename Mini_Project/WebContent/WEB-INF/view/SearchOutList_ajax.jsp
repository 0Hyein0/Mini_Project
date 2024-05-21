<%@page import="com.stock.model.StockListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String ac_code = (String)session.getAttribute("ac_code");
	
	ArrayList<StockListDTO> searchOutList = (ArrayList<StockListDTO>) request.getAttribute("searchOutList");
	
	String result = "";
	
	// 제이슨 형태로 구성
	if(!searchOutList.isEmpty())
	{
		for (StockListDTO searchOut : searchOutList) 
		{
			StringBuffer sb = new StringBuffer();
			
			sb.append("{\"out_code\":\"" + searchOut.getOut_code() + "\"");
			sb.append(",\"pr_code\":\"" + searchOut.getPr_code() + "\"");
			sb.append(",\"pr_name\":\"" + searchOut.getPr_name() + "\"");
			sb.append(",\"out_date\":\"" + searchOut.getOut_date() + "\"");
			sb.append(",\"out_quantity\":\"" + searchOut.getOut_quantity() + "\"");
			sb.append(",\"out_description\":\"" + searchOut.getOut_description() + "\"");
			sb.append(",\"wa_name\":\"" + searchOut.getWa_name() + "\"},");
			
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
