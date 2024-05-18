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
<title>재고 관리 :: 로그인</title>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/loginStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body id="body_background">
	<section>
		<div id=main_div>
			<div id="login_div" >
				<div class="login_box">
					<span>재고 관리 시스템</span>
					<form action="login.do" method="get" id="loginForm">
						<table>
							<tr>
								<td>
									<input type="text" id="ac_code" name="ac_code" class="login_input" placeholder="아이디"/>
								</td>
								<td rowspan="2">
									<button type="submit" id="loginBtn">로그인</button>
								</td>
							</tr>
							<tr>
								<td>
									<input type="password" id="ac_pw" name="ac_pw" class="login_input" placeholder="비밀번호"/>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>	
		</div>
	</section>
</body>
</html>