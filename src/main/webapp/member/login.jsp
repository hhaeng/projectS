<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 로그인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		
		<form action="/projectS/member?command=login.do" method="post">
			<div class="mb-3">
				<label for="user_id" class="form-label">아이디</label> 
				<input type="text" class="form-control" name="user_id" id="user_id">
			</div>
			<div class="mb-3">
				<label for="user_pwd" class="form-label">비밀번호</label> 
				<input type="password" class="form-control" name="user_pwd" id="user_pwd">
			</div>
			
			<!-- <input type="hidden" name="command" value="login"/> -->
			<input type="submit" class="btn btn-success" name="command" value="로그인"/>
			<button class="btn btn-success" onclick="history.back()">취소</button>
			
		</form>
	</div>
</body>
</html>