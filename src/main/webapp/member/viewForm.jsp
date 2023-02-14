<%@page import="projectS.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//request객체 저장되어 있는 데이터를 메모리변수 저장
MemberDTO dto = (MemberDTO) request.getAttribute("member");

//String id = dto.getId();
String session_id=null;
if(session.getAttribute("id")==null){
	session_id="";
}else{
	session_id=(String)session.getAttribute("id");
	session_id=session_id+"님 접속중";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 회원 조회</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div> <%=session_id %></div>
		<div class="d-flex justify-content-end">
			<%
			if(session_id.equals("")){
			%>
			<a class="btn btn-success" href="/projectS/member/login.html">로그인</a>
			<% } else {  %>
			<a class="btn btn-success" href="/projectS/member?command=logout">로그아웃</a>
			<% } %>
		</div>
		
		<div class="p-2 mt-2">
			<div class="mb-3">
				<label class="form-label">아이디</label><br>
				<div class="border border-success p-2 mb-2 rounded border-opacity-50"><%=dto.getId()%></div>
			</div>
			<div class="mb-3">
				<label class="form-label">이름</label> <br>
				<div class="border border-success p-2 mb-2 rounded border-opacity-50"><%=dto.getName()%></div>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">이메일</label> <br>
				<div class="border border-success p-2 mb-2 rounded border-opacity-50"><%=dto.getEmail()%></div>
			</div>

			<div>
				<a class="btn btn-success btn-sm" href="/projectS/member?command=modifyMember&id=<%=dto.getId()%>">수정</a>
				<a class="btn btn-success btn-sm" href="/projectS/member?command=delMember&id=<%=dto.getId()%>">삭제</a> 
				<a class="btn btn-success btn-sm" href="/projectS/member">목록</a>
			</div>
		</div>
	</div>
</body>
</html>
 
 