<%@page import="java.util.Set"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="com.stock.model.StockListDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String ac_code = (String)session.getAttribute("ac_code");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 조회</title>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/listStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/jquery-ui-i18n.min.js"></script>

<script>
  $( function() {
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    $( "#datepicker" ).datepicker();
  } );
</script>

</head>
<body>

	<header>
		<c:import url="/WEB-INF/view/MenuBar.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div id="content_div">
				<div id="search_div">
					<div style="width: 20%;">
						[품번]
						<select id="prCode" class="form-control">
							<option selected="selected">-전체 품번-</option>
							<c:forEach var="pr" items="${prList }">
								<option value="${pr.pr_code }">[${pr.pr_code}] ${pr.pr_name}</option>
							</c:forEach>
						</select>
					</div>
					<div style="width: 20%;">
						[창고]
						<select id="waName" class="form-control">
							<option selected="selected">-전체 창고-</option>
							<c:forEach var="wa" items="${waList }">
								<option value="${wa.wa_code }">${wa.wa_name}</option>
							</c:forEach>
						</select>
					</div>
					<div style="width: 20%;">
						[조회 기준 일자]<br>
						<input type="text" id="datepicker" class="form-control">
					</div>
					<div style="width: 20%;">
						[정렬]
						<select id="sorting" class="form-control">
							<option>기본</option>
							<option>재고 수량 많은 순</option>
							<option>재고 수량 적은 순</option>
						</select>
					</div>
					<div>
						<button id="searchBtn">조회</button>
					</div>
				</div>
				
				<table class="table">
					<thead>
				    	<tr>
				      		<th scope="col">품번</th>
					      	<th scope="col">품명</th>
					      	<th scope="col">입고 수량</th>
					      	<th scope="col">출고 수량</th>
					      	<th scope="col">재고 수량</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  	
				  		<c:forEach var="stockList" items="${stockList }">
				   		<tr>
			      			<td>${stockList.pr_code }</td>
			      			<td>${stockList.pr_name }</td>
			      			<td>${stockList.total_in }</td>
			      			<td>${stockList.total_out }</td>
			      			<td>${stockList.total_in - stockList.total_out }</td>
				    	</tr>
				    	</c:forEach>
				 	</tbody>
				</table>
			</div>
		</div>
	</section>

</body>
</html>