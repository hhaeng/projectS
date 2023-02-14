<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//String id = request.getParameter("id");
//String pwd = request.getParameter("password"); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 회원 정보</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<div class="p-2 mt-2">
		<h4>회원 정보 조회</h4>
			<div class="mb-3">
				<label class="form-label">아이디</label><br>
				<div class="border border-success p-2 mb-2 rounded border-opacity-50">
				${param.id}
				</div>
			</div>
			<div class="mb-3">
				<label class="form-label">비밀번호</label><br>
				<div class="border border-success p-2 mb-2 rounded border-opacity-50">
				${param.password}
				</div>
			</div>
			<div class="mb-3">
				<label class="form-label">이름</label> <br>
				<div class="border border-success p-2 mb-2 rounded border-opacity-50">
				${param.name}
				</div>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">이메일</label> <br>
				<div for="email" class="border border-success p-2 mb-2 rounded border-opacity-50">
				${param.email}
				</div>
			</div>
   			<a class="btn btn-success" href="/projectS/member">목록</a>


		</div>
	</div>
</body>
</html>