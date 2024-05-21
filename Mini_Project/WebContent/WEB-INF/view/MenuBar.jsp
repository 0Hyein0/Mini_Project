<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String ac_code = (String)session.getAttribute("ac_code");
	String ac_name = (String)session.getAttribute("ac_name");
%>
<div class="navbar-expand-lg bg-body-tertiary" style="height: 60px; display: flex; justify-content: space-between; align-items: center; padding-left: 40px; padding-right: 40px;">
	<div>
		<a style="font-size: 27px; text-decoration: none; color: black;" href="stocklist.do">재고 관리 시스템</a>
	</div>
	<div>
		<button style="border: none; background: none;">
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"/>
			  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
			</svg>
		</button>
	</div>
</div>


<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary" style="width: 280px; height: 100%; position: fixed;">
    <div id="name_div">
    	<%=ac_name %>
    </div>
    <ul class="nav nav-pills flex-column mb-auto">
      <li>
        <a href="stocklist.do" class="nav-link link-body-emphasis">
          재고 조회
        </a>
      </li>
      <li>
        <a href="inlist.do" class="nav-link link-body-emphasis">
          입고 관리
        </a>
      </li>
      <li>
        <a href="outlist.do" class="nav-link link-body-emphasis">
          출고 관리
        </a>
      </li>
    </ul>
  </div>
