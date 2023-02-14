 <%@page import="projectS.dto.MemberDTO"%>
<%@page import="projectS.dao.MemberDAO"%>
<%@page import="java.util.List"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    isELIgnored="false"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
// 정보공유 request, appication, session, page
//MemberDTO m = new MemberDTO();
 
/*
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email= request.getParameter("email");

System.out.println(id);
System.out.println(password);
System.out.println(name);
System.out.println(email);
*/
%>
<!-- 빈 생성: MemberDTO객체 생성 -->
<jsp:useBean id="beanMemberDTO" class="projectS.dto.beanMemberDTO"  scope="page"/>
<%-- 
<jsp:setProperty property="id" name="beanMemberDTO" 
				value='<%=request.getParameter("id") %>'/>
<jsp:setProperty property="pwd" name="beanMemberDTO" 
				value='<%=request.getParameter("password") %>'/>
<jsp:setProperty property="name" name="beanMemberDTO" 
				value='<%=request.getParameter("name") %>'/>
<jsp:setProperty property="email" name="beanMemberDTO" 
				value='<%=request.getParameter("email") %>'/>
--%>			
<!-- List객체 생성하기 -->
<jsp:useBean id="membersListTest" class="java.util.ArrayList"/>
<jsp:useBean id="membersMap" class="java.util.HashMap"/>


<%
membersMap.put("id","hong");
membersMap.put("pwd","1234");
membersMap.put("name","hong4");
membersMap.put("email","hong4@gmail.com");

membersListTest.add(membersMap);
membersMap.put("membersList",membersListTest);

MemberDAO dao = new MemberDAO();
// 회원 등록
//dao.addMember(beanMemberDTO);
// 회원 목록
List<MemberDTO> list = dao.listMember();

//System.out.println(list);

System.out.println(membersListTest);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean을 활용한 회원 조회</title>
</head>
<body>
<%--<jsp:setProperty property="id" name="beanMemberDTO" />--%>
<hr>
<div>컨텍스트 경로: <%=request.getContextPath() %></div>
<div>컨텍스트 경로(EL): ${pageContext.request.contextPath}</div>

<a href="/web01/member/memberView2.jsp">memberView2.jsp연결하기</a>
<a href="<%=request.getContextPath() %>/el/memberView2.jsp">memberView2.jsp연결하기</a>
<a href="${pageContext.request.contextPath}/el/memberView2.jsp">memberView2.jsp연결하기</a>
<hr>
<%--<jsp:forward page="/el/memberView2.jsp"></jsp:forward>--%>

<hr>
${membersMap.id}
${membersMap.pwd}
${membersMap.name}
${membersMap.email}

${ membersListTest[0].id}
${ membersListTest[0].pwd}
${ membersListTest[0].name}
${ membersListTest[0].email}

${membersMap.membersListTest[0].id}
${membersMap.membersListTest[0].pwd}
${membersMap.membersListTest[0].name}
${membersMap.membersListTest[0].email}


</body>
</html>






