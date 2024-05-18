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
			    		<th scope="col">#</th>
			    		<th scope="col">관리코드</th>
			      		<th scope="col">품번</th>
				      	<th scope="col">품명</th>
				      	<th scope="col">유통기한</th>
				      	<th scope="col">입고 수량</th>
				      	<th scope="col">출고 수량</th>
				      	<th scope="col">재고 수량</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			  	
			  		<c:forEach var="stockList" items="${stockList }">
			   		<tr>
			      		<th scope="row">1</th>
		      			<td>${stockList.pr_no }</td>
		      			<td>${stockList.pr_code }</td>
		      			<td>${stockList.pr_name }</td>
		      			<td>
		      				<c:choose>
		      					<c:when test="${stockList.pr_date =='9999-12-31'}">
									-
		      					</c:when>
								<c:otherwise>
			      					${stockList.pr_date }
								</c:otherwise>	      				
		      				</c:choose>
		      			</td>
		      			<td>${stockList.total_in }</td>
		      			<td>${stockList.total_out }</td>
		      			<td>${stockList.total_in - stockList.total_out }</td>
			    	</tr>
			    	</c:forEach>
			 	</tbody>
			</table>
		</div>
	</section>

</body>
</html>