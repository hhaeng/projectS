<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String mess = request.getParameter("mess");
String login_result = "";
if (mess.equals("user_id")) {	//
	login_result = "아이디가 일치하지 않습니다.";
} else if(mess.equals("user_pwd")){ 	//
	login_result = "비밀번호가 일치하지 않습니다.";
}
else if(mess.equals("logout")){
	login_result = "로그아웃 되었습니다.";
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="alert alert-danger" role="alert">
			<%=login_result%>
		</div>
		<div><!-- d-grid gap-2 d-md-block -->
		<% if(mess.equals("logout")) { %>
		  <a href="/projectS/member" class="btn btn-success" type="button">목록</a>
		<% } else { %>
		  <a href="/projectS/member/login.jsp" class="btn btn-success" type="button">로그인 페이지 이동</a>
		<% } %>
		
		<a href="/projectS/member" class="btn btn-success" type="button">목록</a>
		
		</div>
	</div>
</body>
</html>