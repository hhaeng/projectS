<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%-- <%@ include file="../include/pagination_header.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<style type="text/css">
	* { margin: 5px; padding: 0;}
	table {
		width: 500px;
		border: 1px solid gray;
		border-collapse: collapse;
		margin-left: auto; margin-right: auto;
		
	}
	th,td {
		border: 1px solid gray;
		text-align: center;
		height: 30px;
	}
	a { text-decoration: none;} 
	#title { margin-top: 20px; margin-bottom: 20px;}
	#write, #search { 
		width: 500px; border : 1px solid gray;
		margin-left: auto; margin-right: auto;
		}
</style>
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">

	$(function() {
		console.log('Ok...');
		
		$('#container > #form1').each(function(i, item) {
			//console.log(i);
			console.log($(this).index());
			var formContainer = $(this);
			//console.log(formContainer.attr('id'));
			
			$(this).find('#btnOk').click(function() {

				console.log($(this).val());
				console.log("abcv:"+$(this).prev().val());
				
				
				var passwd = $(this).prev();
				if (passwd.val()==''){
					alert('비밀번호를 입력하세요');
					passwd.focus();
					return
				}
				// 현재 클릭한 btnOk버튼의 form을 지칭
				formContainer.submit();
				
			});	// btnOk 버튼
			
		});// form1 배열 구조: each(): 일괄적으로 같은 이벤트 처리하고자할 경우

	});
	
	

</script>
</head>
<body>
<h2>방명록 리스트</h2>
<hr>
<div id="search">
	<form action="${contextPath }/guestbook_servlet/search.do" method="post" name="search">
		<select name="searchkey" id="">
			<c:choose>
				<c:when test="${searchkey == 'name' }">
					<option value="name" selected="selected">이름</option>
					<option value="content">내용</option>
					<option value="name_content">이름+내용</option>
				</c:when>
				<c:when test="${searchkey == 'content' }">
					<option value="name" >이름</option>
					<option value="content" selected="selected">내용</option>
					<option value="name_content">이름+내용</option>
				</c:when>
				<c:when test="${searchkey == 'name_content' }">
					<option value="name" >이름</option>
					<option value="content">내용</option>
					<option value="name_content" selected="selected">이름+내용</option>
				</c:when>
				<c:otherwise>
					<option value="name"  selected="selected">이름</option>
					<option value="content">내용</option>
					<option value="name_content" >이름+내용</option>
				</c:otherwise>
			</c:choose>
		</select>
		<input type="text"  name="search" value="${search }"/>
		<input type="submit" value="검색" />
	</form>
</div>
<div id="write">
<input type="button" value="글쓰기" onclick='location.href="${contextPath}/guestbook/write.jsp"'/><br>
${list.size() }개의 글이 있습니다.
</div>
<div id="container">
<c:forEach var="dto" items="${list }">
	<form	name="form1"  id="form1"
		action="${path }/guestbook_servlet/passwd_check.do">
		<input type="hidden" name="idx" value=${dto.idx } />
		<table>
			<tr>
				<td>이름</td>
				<td>${dto.name }</td>
				<td>날짜</td>
				<td>${dto.post_date }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="3">${dto.email }</td>
			</tr>
			<tr>
				<td colspan="4">${dto.content}</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="password" name="passwd" value=""/>
					<input type="button" id="btnOk" value="수정/삭제${dto.idx }">
					<!-- <input type="submit" id="btnOk" value="수정/삭제"> -->
				</td>
			</tr>
		</table>
	</form>
</c:forEach>
</div>

</body>
</html>