<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
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
			      		<th scope="col">품번</th>
				      	<th scope="col">품명</th>
				      	<th scope="col">재고수량</th>
				      	<th scope="col">창고</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			   		<tr>
			      		<th scope="row">1</th>
		      			<td>Mark</td>
		      			<td>Otto</td>
		      			<td>@mdo</td>
		      			<td>@mdo</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">2</th>
			      		<td>Jacob</td>
			      		<td>Thornton</td>
			      		<td>@fat</td>
			      		<td>@fat</td>
		    		</tr>
			 	</tbody>
			</table>
		</div>
	</section>

</body>
</html>