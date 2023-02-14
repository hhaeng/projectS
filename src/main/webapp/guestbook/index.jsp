<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 컨트롤 페이지 이동
String context = request.getContextPath();
response.sendRedirect(context+"/guestbook_servlet/list.do");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿에 요청하는 시작페이지</title>
</head>
<body>
</body>
</html>