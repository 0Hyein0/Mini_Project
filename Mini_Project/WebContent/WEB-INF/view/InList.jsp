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

	// select option에 중복 제거
	List<StockListDTO> inList = (List<StockListDTO>)request.getAttribute("inList");
	
	// 품번 중복 제거
	Set<String> uniquePrCode = new LinkedHashSet<>();
	for(StockListDTO in : inList)
		uniquePrCode.add("[" + in.getPr_code() + "] " + in.getPr_name());
	
	// 창고 중복 제거
	Set<String> uniqueWaName = new LinkedHashSet<>();
	for(StockListDTO in : inList)
		uniqueWaName.add(in.getWa_name());
		
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
  $( function() {
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    $( "#datepicker1" ).datepicker();
  } );
  
  $( function() {
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    $( "#datepicker2" ).datepicker();
  } );
  
  $( function() {
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    $( "#datepicker3" ).datepicker();
  } );
</script>

<script>
	$(function()
	{
		$("#addBtn").click(function()
		{
			for
		})
	})

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
		       		  <form action="indatainsert.do?ac_code=<%=ac_code %>" id="inDataForm" >
				      	<div class="modal-body">
					        <div>
					        	<table>
					        		<tr>
					        			<td>
						        			<label for="recipient-name" class="col-form-label">입고 품목</label>
								            <select id="prCode" class="form-control">
												<option selected="selected">-품목 선택-</option>
												<%for (String prCode : uniquePrCode) {%>
													<option value=""><%=prCode %></option>
												<%} %>
											</select>
					        			</td>
					        			<td>
					        				<label for="recipient-name" class="col-form-label">입고 창고</label>
								            <select id="waName" class="form-control">
												<option selected="selected">-입고 창고 선택-</option>
												<%for (String waName : uniqueWaName) {%>
													<option value=""><%=waName %></option>	
												<%} %>
											</select>
					        			</td>
					        		</tr>
					        		<tr>
					        			<td>
					        				<label for="recipient-name" class="col-form-label">입고 수량</label>
					            			<input type="text" class="form-control" id="inCount" placeholder="입고 수량을 입력해주세요">
					        			</td>
					        			<td>
					        				<label for="recipient-name" class="col-form-label">입고(예정) 일자</label>
					            			<input type="text" class="form-control" id="datepicker3">
					        			</td>
					        		</tr>
					        		<tr>
					        			<td colspan="2">
					        				<label for="message-text" class="col-form-label">비고란</label>
					            			<textarea class="form-control" id="inDescription"></textarea>
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
					<div>
						[품번]
						<select id="prCode" class="form-control">
							<option selected="selected">-전체 품번-</option>
							<%for (String prCode : uniquePrCode) {%>
								<option><%=prCode %></option>
							<%} %>
						</select>
					</div>
					<div>
						[입고 창고]
						<select id="waName" class="form-control">
							<option selected="selected">-전체 창고-</option>
							<%for (String waName : uniqueWaName) {%>
								<option><%=waName %></option>	
							<%} %>
						</select>
					</div>
					<div>
						[조회 시작 일자]<br>
						<input type="text" id="datepicker1" class="form-control">
					</div>
					<div>
						[조회 종료 일자]<br>
						<input type="text" id="datepicker2" class="form-control">
					</div>
					<div>
						<button style="width: 80px; height: 80px;">조회</button>
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
		</div>
	</section>

</body>
</html>