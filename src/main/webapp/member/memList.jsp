<%@page import="projectS.url.LoginImpl"%>
<%@page import="projectS.dto.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
	// request객체 저장되어 있는 데이터를 메모리변수 저장	
	// request객체 저장된 데이터는 요청과 응답 관계에서만 공유
	List<MemberDTO> list = (List) request.getAttribute("memberList"); //listMember//
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
<title>전체 회원 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-end col-12">
			<%-- <div> <%= session_id %>현재 접속자: <%= count %></div> --%>
			<div class="p-2 d-flex justify-content-start" >
				<% if (session_id.equals("")) {%>
					<!-- <a href="/projectS/member/login.html" class="btn btn-success btn-sm">로그인</a> -->
					<a href="/projectS/member/login.jsp" class="btn btn-success btn-sm">로그인</a>
				<%} else { %>
					<a href=/projectS/member?command=logout" class="btn btn-success btn-sm">로그아웃</a>
				<%} %>
			</div>
			
			<div class="p-2 d-flex justify-content-end">
				<a href="/projectS/member/memberForm.jsp" class="btn btn-success btn-sm">회원가입
				<!-- <a href="/projectS/member/addMember.jsp" class="btn btn-success">회원가입 -->
				</a>
			</div>
		</div>
	</div>

	<div class="container">
		<h3>전체 회원 목록</h3>
		<hr>
		<table class="table ">
			<thead>
				<tr>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">이메일</th>
					<th scope="col">가입일자</th>
					<th scope="col">수정 / 삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < list.size(); i++) {
					dto = (MemberDTO) list.get(i);

					String id = dto.getId();
					String name = dto.getName();
					String email = dto.getEmail();
					Date joinDate = dto.getJoinDate();
				%>
				<tr>
					<th scope="row"><%=id%></th>
					<td>
						<a href="/projectS/member?command=viewMember&id=<%=id%>"><%=name%></a>
						
					</td>
					<td><%=email%></td>
					<td><%=joinDate%></td>
					<td><a href="<%=path %>/member?command=modifyMember&id=<%=id%>">수정</a> /
						<a href="<%=path %>/member?command=delMember&id=<%=id%>">삭제</a></td>
				</tr>
				<% };%>
			</tbody>
		</table>

	</div>

</body>
</html>