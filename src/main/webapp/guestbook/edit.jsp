<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정</title>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		console.log('jQuery Ok...');
		
		// 전송버튼 클릭시 항목별 유효성 검사
		$('#btnOk').click(function(){
			var name 	= $('#name');
			var email 	= $('#email');
			var passwd 	= $('#passwd');
			var content = $('#content');
			
			if (name.val()==''){
				alert('이름을 입력해주세요.');
				name.focus();
				return;
			}
			if (email.val()==''){
				alert('이메일을 입력해주세요.');
				email.focus();
				return;
			}
			if (passwd.val()==''){
				alert('비밀번호을 입력해주세요.');
				passwd.focus();
				return;
			}
			if (content.val()==''){
				alert('내용을 입력해주세요.');
				content.focus();
				return;
			}
			
			// action에서 설정된 url로 값을 전송
			document.form1.submit();
			
		});
		// 목록 버튼 클릭시 방명록 목록 페이지 이동
		$('#btnList').click(function() {
			location.href='${pageContext.request.contextPath }/guestbook_servlet/list.do';
		});
		// 삭제 버튼 클릭
		$('#btnDel').click(function() {
			var result = confirm('삭제하시겠습니까?');
			console.log('result:'+result);
			
			if (result){
				location.href='${pageContext.request.contextPath }/guestbook_servlet/delete.do?idx=${dto.idx}';
			} else {
				location.href='${pageContext.request.contextPath }/guestbook_servlet/list.do';
			}
			
		})
		
	});
	
</script>
</head>
<body>
<h2>방명록 수정</h2>
<hr>

<form action="${pageContext.request.contextPath }/guestbook_servlet/update.do"
		name="form1" id="form1" method="post">
<table>
	<tr>
		<td>이름</td>
		<td>
			<input type="text" name="name" id="name" size="40" value=${dto.name }>
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			<input type="text" name="email" id="email" size="40" value=${dto.email }>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="passwd" id="passwd" size="40" value=${dto.passwd }>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="5" cols="55" name="content" id="content">${dto.content }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" >
			<input type="hidden" name="idx" value="${dto.idx }" />
			<input type="button" id="btnOk" value="수정">
			<input type="button" id="btnDel" value="삭제">
			<input type="button" id="btnList" value="목록" >
		</td>
	</tr>
</table>

</form>

</body>
</html>