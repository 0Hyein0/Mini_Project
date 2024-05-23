<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.stock.model.StockListDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String ac_code = (String)session.getAttribute("ac_code");
	
	String in_code = request.getParameter("in_code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고 내역 조회</title>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/listStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/jquery-ui-i18n.min.js"></script>

</head>
<body>

	<header>
		<c:import url="/WEB-INF/view/MenuBar.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div id="content_div">
				<div class= "detail_div">
					<span>입고 내역 조회</span><span>(입고 코드 : <%=in_code %>)</span>
				</div>
			
				<table class="table">
					<thead>
				    	<tr>
				      		<th scope="col">품번</th>
					      	<th scope="col">품명</th>
					      	<th scope="col">입고 일자</th>
					      	<th scope="col">입고 수량</th>
					      	<th scope="col">비고</th>
					      	<th scope="col">입고 창고</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach var="inListDetail" items="${inListDetail }">
				   		<tr>
			      			<td>${inListDetail.pr_code }</td>
			      			<td>${inListDetail.pr_name }</td>
			      			<td>${inListDetail.in_date }</td>
			      			<td>${inListDetail.in_quantity }</td>
			      			<td>${inListDetail.in_description }</td>
			      			<td>${inListDetail.wa_name }</td>
				    	</tr>
				    	</c:forEach>
				 	</tbody>
				</table>
				
			</div>
		</div>
	</section>

</body>
</html>