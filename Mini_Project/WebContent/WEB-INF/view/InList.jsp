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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mainStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<header>
		<c:import url="/WEB-INF/view/MenuBar.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<table class="table">
				<thead>
			    	<tr>
			    		<th scope="col">입고 코드</th>
			      		<th scope="col">품번</th>
				      	<th scope="col">품명</th>
				      	<th scope="col">입고 일자</th>
				      	<th scope="col">입고 수량</th>
				      	<th scope="col">비고</th>
				      	<th scope="col">입고 창고</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			  	
			  		<c:forEach var="inList" items="${inList }">
			   		<tr>
		      			<td>${inList.in_code }</td>
		      			<td>${inList.pr_code }</td>
		      			<td>${inList.pr_name }</td>
		      			<td>${inList.in_date }</td>
		      			<td>${inList.in_quantity }</td>
		      			<td>${inList.in_description }</td>
		      			<td>${inList.wa_name }</td>
			    	</tr>
			    	</c:forEach>
			 	</tbody>
			</table>
		</div>
	</section>

</body>
</html>