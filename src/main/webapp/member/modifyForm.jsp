
<%@page import="projectS.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//request객체 저장되어 있는 데이터를 메모리변수 저장
	MemberDTO dto = (MemberDTO)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h4>회원 정보 수정</h4>
		<form name="frmMember">
			<div class="mb-3">
				<label for="id" class="form-label" >아이디: <%= dto.getId() %> </label><br>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">비밀번호</label>
				<input type="password" class="form-control" name="password" value=<%=dto.getPwd() %>
					id="password">
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" name="name" value=<%=dto.getName() %>
					id="name" >
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">이메일</label>
				<input type="email" class="form-control" name="email" value=<%=dto.getEmail() %>
					id="email" >
			</div>
			
			 <input type="button" 
			 		class="btn btn-success" 
			 		value="수정완료"
			  		onclick="fn_sendMember()">
	  		<button class="btn btn-success" onclick="history.back()">취소</button>
   		
   			<input type="hidden" name="id" value=<%=dto.getId()%>>
			<input type="hidden" name="command" value="updateMember">
			
		</form>
	</div>
	
	<script type="text/javascript">
		function fn_sendMember(){
			//console.log("fn_sendMember()...");
			
			// 자바스크립트에서 <form>태그의 name으로 접근해 입력한 값들을 얻어옴.			
			
			var frmMember = document.frmMember;
			
			var pwd = frmMember.password.value;
			var email = frmMember.email.value;
			
			if(pwd.length== 0 || pwd==""){
				alert("비밀번호는 필수입니다.")
			}else if(email.length== 0 || email==""){
				alert("이메일은 필수입니다.")
			}else{
				frmMember.method = "post";
				frmMember.action = "/projectS/member"; //서블릿 요청
				frmMember.submit(); // 전송(요청)
			}
			
		}
	</script>
</body>
</html>


