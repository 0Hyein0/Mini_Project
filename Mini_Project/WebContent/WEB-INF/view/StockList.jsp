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
  
  
  function search()
  {
  	var prCode = $("#prCode").val();
  	var waCode = $("#waCode").val();
  	var searchDate = $("#datepicker").val();
  	
  	$.ajax
  	({
  		type: "GET"
  	  , url: "searchstocklist.do"
  	  , data: {pr_code: prCode, wa_code: waCode, search_date: searchDate}
  	  , dataType: "json"
  	  , success: function(jsonObj)
  		{
  			for(var idx=0; idx<jsonObj.length; idx++)
  			{
  				var out = "";
  				
  				var pr_code = jsonObj[idx].pr_code;
  				var pr_name = jsonObj[idx].pr_name;
  				var total_in = jsonObj[idx].total_in;
  				var total_out = jsonObj[idx].total_out;
  				var total = total_in - total_out;
  				
  				out += "<td>" + pr_code + "</td>";
  				out += "<td>" + pr_name + "</td>";
  				out += "<td>" + total_in + "</td>";
  				out += "<td>" + total_out + "</td>";
  				out += "<td>" + total + "</td>";
  			}
  			
  			$("#searchStockList").empty();
  			$("#searchStockList").append(out);
  		}
  		, error: function(error)
  		{
  			alert(error.reponseText);
  		}
  	});
  }
</script>

</head>
<body>

	<header>
		<c:import url="/WEB-INF/view/MenuBar.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div id="content_div">
			
				<div class="add_data">
					<button type="button" class="btn add_btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">
						<span>+ 제품 등록</span>
					</button>
				</div>
				
				<!-- 제품 등록 모달창 -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">제품 등록</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
		       		  <form action="productinsert.do" id="inProductForm" >
				      	<div class="modal-body">
					        <div>
					        	<table>
					        		<tr>
					        			<td>
						        			품번
								            <input type="text" class="form-control" id="inputPrCode" name="inputPrCode" placeholder="품번을 입력해주세요">
					        			</td>
					        			<td>
						        			품명
								            <input type="text" class="form-control" id="inputPrName" name="inputPrName" placeholder="품명을 입력해주세요">
					        			</td>
					        		</tr>
					        		<tr>
					        			<td colspan="2">
					        				비고
					            			<textarea class="form-control" id="inputPrDescription" name="inputPrDescription"></textarea>
					        			</td>
					        		</tr>
					        	</table>
					        </div>
					      </div>
					      <div class="modal-footer">
					        <button type="submit" class="btn btn-primary" id="addBtn">등록하기</button>
					      </div>
				        </form>
				    </div>
				  </div>
				</div>
			
			
				<div id="search_div">
					<div style="width: 25%;">
						[품번]
						<select id="prCode" class="form-control">
							<option selected="selected">-전체 품번-</option>
							<c:forEach var="pr" items="${prList }">
								<option value="${pr.pr_code }">[${pr.pr_code}] ${pr.pr_name}</option>
							</c:forEach>
						</select>
					</div>
					<div style="width: 25%;">
						[창고]
						<select id="waCode" class="form-control">
							<option selected="selected">-전체 창고-</option>
							<c:forEach var="wa" items="${waList }">
								<option value="${wa.wa_code }">${wa.wa_name}</option>
							</c:forEach>
						</select>
					</div>
					<div style="width: 25%;">
						[조회 기준 일자]<br>
						<input type="text" id="datepicker" class="form-control">
					</div>
					<div>
						<button id="searchBtn" onclick="search()">조회</button>
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
				  	<tbody id="searchStockList">
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