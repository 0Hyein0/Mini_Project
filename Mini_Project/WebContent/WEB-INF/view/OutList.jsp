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
<title>출고 관리</title>

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
    $( "#datepicker2" ).datepicker();
    $( "#datepicker3" ).datepicker();
  } );

  	// 창고 select box의 option 동적 생성
	function warehouseChange()
	{
		var prCode = $("#prCode").val();	
		var acCode = "<%=ac_code%>";
		
		$.ajax(
		{
		  type: "GET"
		, url: "warehouselist.do"
		, data: {pr_code: prCode, ac_code: acCode}
		, dataType: "json"
		, success: function (jsonObj)
		{
			
			codeArray = [];
			nameArray = [];
            
            for (var idx = 0; idx < jsonObj.length; idx++) 
            {
                var wa_code = jsonObj[idx].wa_code;
                var wa_name = jsonObj[idx].wa_name;
                codeArray.push(wa_code);
                nameArray.push(wa_name);
            }
            
            var waSelect = $("#waName");
            waSelect.empty();
            waSelect.append('<option selected="selected">-출고 창고 선택-</option>');
            
           for(var i=0; i<codeArray.length; i++)
           {
               var option = $('<option></option>').attr("value", codeArray[i]).text(nameArray[i]);
               waSelect.append(option);
           }
		}
		,error: function(error) 
		{
            alert("오류");
		}
		});
	}
  	
	// 수량 input의 placeholder 동적 생성
	function maxQuantityChange()
	{
		var prCode = $("#prCode").val();
		var waCode = $("#waName").val();
		var acCode = "<%=ac_code%>";
		
		$.ajax(
		{
		  type: "GET"
		, url: "maxquantity.do"
		, data: {pr_code: prCode, ac_code: acCode, wa_code: waCode}
		, success: function (args)
		{
			$("#outQuantity").attr("placeholder", "출고 가능 수량 : "+ args);
		}
		,error: function(error) 
		{
            alert("오류 발생");
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
						<span>+ 출고 등록</span>
					</button>
				</div>
				
				<!-- 출고 등록 모달창 -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">출고 등록</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
		       		  <form action="outdatainsert.do" id="outDataForm" >
				      	<div class="modal-body">
					        <div>
					        	<table>
					        		<tr>
					        			<td>
						        			출고 품목
								            <select id="prCode" class="form-control" name="pr_code" onchange="warehouseChange()">
												<option selected="selected">-품목 선택-</option>
												<c:forEach var="pr" items="${prList }">
													<option value="${pr.pr_code }">[${pr.pr_code}] ${pr.pr_name}</option>
												</c:forEach>
											</select>
					        			</td>
					        			<td>
					        				출고 창고
							            	<select id="waName" class="form-control" name="wa_code" onchange="maxQuantityChange()">
												<option selected="selected">-출고 창고 선택-</option>
											</select>
					        			</td>
					        		</tr>
					        		<tr>
					        			<td>
					        				출고 수량
					            			<input type="text" class="form-control" id="outQuantity" name="out_quantity" placeholder="출고 수량을 입력해주세요">
					        			</td>
					        			<td>
					        				출고 일자
					            			<input type="text" class="form-control" id="datepicker3" name="out_date">
					        			</td>
					        		</tr>
					        		<tr>
					        			<td colspan="2">
					        				비고
					            			<textarea class="form-control" id="outDescription" name="out_description"></textarea>
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
						<select id="prCode" class="form-control">
							<option selected="selected">-전체 품번-</option>
							<c:forEach var="pr" items="${prList }">
								<option value="${pr.pr_code }">[${pr.pr_code}] ${pr.pr_name}</option>
							</c:forEach>
						</select>
					</div>
					<div style="width: 20%;">
						[출고 창고]
						<select id="waName" class="form-control">
							<option selected="selected">-출고 창고-</option>
							<c:forEach var="wa" items="${waList }">
								<option value="${wa.wa_code }">${wa.wa_name}</option>
							</c:forEach>
						</select>
					</div>
					<div style="width: 20%;">
						[조회 시작 일자]<br>
						<input type="text" id="datepicker1" class="form-control">
					</div>
					<div style="width: 20%;">
						[조회 종료 일자]<br>
						<input type="text" id="datepicker2" class="form-control">
					</div>
					<div>
						<button id="searchBtn">조회</button>
					</div>
				</div>
				
			
				<table class="table">
				<thead>
			    	<tr>
			    		<th scope="col">출고 코드</th>
			      		<th scope="col">품번</th>
				      	<th scope="col">품명</th>
				      	<th scope="col">출고 일자</th>
				      	<th scope="col">출고 수량</th>
				      	<th scope="col">비고</th>
				      	<th scope="col">출고 창고</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			  	
			  		<c:forEach var="outList" items="${outList }">
			   		<tr>
		      			<td>${outList.out_code }</td>
		      			<td>${outList.pr_code }</td>
		      			<td>${outList.pr_name }</td>
		      			<td>${outList.out_date }</td>
		      			<td>${outList.out_quantity }</td>
		      			<td>${outList.out_description }</td>
		      			<td>${outList.wa_name }</td>
			    	</tr>
			    	</c:forEach>
			 	</tbody>
			</table>
			</div>
		</div>
	</section>

</body>
</html>