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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고 관리</title>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/listStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/jquery-ui-i18n.min.js"></script>
<script>
$( function() 
	{
	    $.datepicker.setDefaults($.datepicker.regional['ko']);
	    $("#datepicker1").datepicker();
	    $("#datepicker2").datepicker();
	    $("#datepicker3").datepicker();
	    $("#startDate").datepicker();
	    $("#endDate").datepicker();
  });
  
  
function search()
{
	var prCode = $("#searchPrCode").val();
	var waCode = $("#searchWaCode").val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	alert(prCode+waCode+startDate+endDate);
	
	$.ajax
	({
		type: "GET"
	  , url: "searchinlist.do"
	  , data: {pr_code: prCode, wa_code: waCode, start_date: startDate, end_date: endDate}
	  , dataType: "json"
	  , success: function(jsonObj)
		{
			for(var idx=0; idx<jsonObj.length; idx++)
			{
				var out = "";
				
				var in_code = jsonObj[idx].in_code;
				var pr_code = jsonObj[idx].pr_code;
				var pr_name = jsonObj[idx].pr_name;
				var in_date = jsonObj[idx].in_date;
				var in_quantity = jsonObj[idx].in_quantity;
				var in_description = jsonObj[idx].in_description;
				var wa_name = jsonObj[idx].wa_name;
				
				out += "<td>" + in_code + "</td>";
				out += "<td>" + pr_code + "</td>";
				out += "<td>" + pr_name + "</td>";
				out += "<td>" + in_date + "</td>";
				out += "<td>" + in_quantity + "</td>";
				out += "<td>" + in_description + "</td>";
				out += "<td>" + wa_name + "</td>";
			}
			
			$("#searchInList").empty();
			$("#searchInList").append(out);
		}
		, error: function(error)
		{
			alert("에러 발생");
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
						<span>+ 입고 등록</span>
					</button>
				</div>
				
				<!-- 입고 등록 모달창 -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">입고 등록</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
		       		  <form action="indatainsert.do" id="inDataForm" >
				      	<div class="modal-body">
					        <div>
					        	<table>
					        		<tr>
					        			<td>
						        			입고 품목
								            <select id="prCode" class="form-control" name="pr_code">
												<option selected="selected">-품목 선택-</option>
												<c:forEach var="pr" items="${prList }">
													<option value="${pr.pr_code }">[${pr.pr_code}] ${pr.pr_name}</option>
												</c:forEach>
											</select>
					        			</td>
					        			<td>
					        				입고 창고
								            <select id="waName" class="form-control" name="wa_code">
												<option selected="selected">-입고 창고 선택-</option>
												<c:forEach var="wa" items="${waList }">
													<option value="${wa.wa_code }">${wa.wa_name}</option>
												</c:forEach>
											</select>
					        			</td>
					        		</tr>
					        		<tr>
					        			<td>
					        				입고 수량
					            			<input type="text" class="form-control" id="inQuantity" name="in_quantity" placeholder="입고 수량을 입력해주세요">
					        			</td>
					        			<td>
					        				입고 일자
					            			<input type="text" class="form-control" id="datepicker3" name="in_date">
					        			</td>
					        		</tr>
					        		<tr>
					        			<td colspan="2">
					        				비고
					            			<textarea class="form-control" id="inDescription" name="in_description"></textarea>
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
					<div style="width: 20%;">
						[품번]
						<select id="searchPrCode" class="form-control">
							<option selected="selected">-전체 품번-</option>
							<c:forEach var="pr" items="${prList }">
								<option value="${pr.pr_code }">[${pr.pr_code}] ${pr.pr_name}</option>
							</c:forEach>
						</select>
					</div>
					<div style="width: 20%;">
						[입고 창고]
						<select id="searchWaCode" class="form-control">
							<option selected="selected">-전체 창고-</option>
							<c:forEach var="wa" items="${waList }">
								<option value="${wa.wa_code }">${wa.wa_name}</option>
							</c:forEach>
						</select>
					</div>
					<div style="width: 20%;">
						[조회 시작 일자]<br>
						<input type="text" id="startDate" class="form-control">
					</div>
					<div style="width: 20%;">
						[조회 종료 일자]<br>
						<input type="text" id="endDate" class="form-control">
					</div>
					<div>
						<button id="searchBtn" onclick="search()">조회</button>
					</div>
				</div>
				
			
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
				  	<tbody id="searchInList">
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
		</div>
	</section>

</body>
</html>