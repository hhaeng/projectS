<%@page import="projectS.url.LoginImpl"%>
<%@page import="projectS.dto.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
	List<MemberDTO> list = (List) request.getAttribute("memberList"); //listMember
	MemberDTO dto = new MemberDTO();
	String path = (String) request.getAttribute("path");
	
	String session_id = null;
	if (session.getAttribute("id") == null){
		session_id = "";
	} else {
		session_id = (String) session.getAttribute("id");
		session_id = session_id + "님";
	}
	//접속자 수
	int count = LoginImpl.total_user;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<!-- Login, Join 링크 표시 영역 -->
<%-- 		<jsp:include page="/index/header.jsp"></jsp:include> --%>	
	</header>
	<article>
		
		<div class="container">
		<div class="d-flex justify-content-end col-12">
			<%-- <div> <%= session_id %>현재 접속자: <%= count %></div> --%>
			<div class="p-2 d-flex justify-content-start" >
				<% if (session_id.equals("")) {%>
					<a href="/projectS/member/login.html" class="btn btn-success btn-sm">로그인</a>
				<%} else { %>
					<a href=/projectS/member?command=logout" class="btn btn-success btn-sm">로그아웃</a>
				<%} %>
			</div>
			
			<div class="p-2 d-flex justify-content-end">
				<a href="/projectS/member/memberForm.jsp" class="btn btn-success btn-sm">회원가입
				<!-- <a href="/projectS/member/addMember.jsp" class="btn btn-success">회원가입 -->
				</a>
			</div>
			
			<div class="p-2 d-flex justify-content-end">
				<a href="/projectS//guestbook/index.jsp" class="btn btn-success btn-sm">방명록
				</a>
			</div>
		</div>
	</div>
		
	</article>
	
	
	
</body>
</html>














