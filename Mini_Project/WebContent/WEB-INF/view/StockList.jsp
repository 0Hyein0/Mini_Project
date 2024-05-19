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
					<div>
						[품번]
						<select id="prCode" class="form-control">
							<option selected="selected">-전체 품번-</option>
							<c:forEach var="stockList" items="${stockList }">
								<option>
									<c:out value="${stockList.pr_code} ${stockList.pr_name}"></c:out>
								</option>
							</c:forEach>
						</select>
					</div>
					<div>
						[창고]
						<select id="waName" class="form-control">
							<option selected="selected">-전체 창고-</option>
							<c:forEach var="stockList" items="${stockList }">
								<option>
									<c:out value="${stockList.wa_name }"></c:out>
								</option>
							</c:forEach>
						</select>
					</div>
					<div>
						[조회 기준 일자]<br>
						<input type="text" id="datepicker" class="form-control">
					</div>
					<div>
						[정렬]
						<select id="sorting" class="form-control">
							<option>기본</option>
							<option>재고 수량 많은 순</option>
							<option>재고 수량 적은 순</option>
							<option>유통기한 임박 순</option>
						</select>
					</div>
					<div>
						<button style="width: 80px; height: 80px;">조회</button>
					</div>
				</div>
				
				<table class="table">
					<thead>
				    	<tr>
				    		<th scope="col">관리코드</th>
				      		<th scope="col">품번</th>
					      	<th scope="col">품명</th>
					      	<th scope="col">유통기한</th>
					      	<th scope="col">입고 수량</th>
					      	<th scope="col">출고 수량</th>
					      	<th scope="col">재고 수량</th>
					      	<th scope="col">창고</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  	
				  		<c:forEach var="stockList" items="${stockList }">
				   		<tr>
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
			      			<td>${stockList.wa_name }</td>
				    	</tr>
				    	</c:forEach>
				 	</tbody>
				</table>
			</div>
		</div>
	</section>

</body>
</html>