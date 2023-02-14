 <%@page import="projectS.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%	request.setCharacterEncoding("utf-8");
	//request객체 저장되어 있는 데이터를 메모리변수 저장
	MemberDTO dto = (MemberDTO)request.getAttribute("member"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h4>회원 가입</h4>
		<form name="frmMember" action="/projectS/member/member1.jsp" method="post">
			<div class="mb-3">
				<label for="id" class="form-label" >아이디</label>
				<input type="text" class="form-control" name="id" id="id">
			</div>
			
			<div>
				<a class="btn btn-success" id="idCheck" name="idCheck" onclick="fn_idCheck()" onkeydown="inputIdChk()">아이디 중복확인</a>
				 <input type="hidden" name="idDuplication" value="idUncheck"/>
			</div>
			
			<div class="mb-3">
				<label for="password" class="form-label">비밀번호</label>
				<input type="password" class="form-control" name="password"	id="password">
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" name="name" id="name" >
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">이메일</label>
				<input type="email" class="form-control" name="email" id="email" >
			</div>
			
			 <input type="button" 
			 		class="btn btn-success" 
			 		value="가입"
			  		onclick="fn_sendMember()">
			<a class="btn btn-success" href="/projectS/member">목록</a>
	  		 
   		
			<input type="hidden" name="command" value="addMember">

		</form>
	</div>
	
	<script type="text/javascript">
		function fn_sendMember(){
			
			var frmMember = document.frmMember;
			
			var id= frmMember.id.value;
			var pwd = frmMember.password.value;
			var email = frmMember.email.value;
			
			
			if(id.length== 0 || id==""){
				alert("아이디는 필수입니다.")
			
			//}else if(frmMember.idDuplication.value!="idCheck"){
			//	alert("아이디 중복 확인을 해주세요.")		 
			
			}else if(pwd.length== 0 || pwd==""){
				alert("비밀번호는 필수입니다.")
			}else if(email.length== 0 || email==""){
				alert("이메일은 필수입니다.")
			}else{
				//alert("가입 성공");
				frmMember.method = "post";
				frmMember.action = "/projectS/member"; 
				frmMember.submit();
			}	
		}
		
 /*  		
 		function fn_idCheck(){
			console.log("아이디 중복 확인");
			
			var id=$('#id').val();
			$.ajax({
				type: 'POST', 
				async: false,
				url: '/projectS/member',

				data: {id : id},
				success: function(result){
					if(result==1){
						alert("사용가능한 아이디입니다.");

					}else{
						alert("사용불가능한 아이디입니다.");

					}
				}
			})
		}
  		
  		function inputIdChk() {
  			var joinForm = document.joinForm;
  			var idCheck = document.joinForm.idCheck;
  			document.joinForm.idDuplication.value="idUncheck";
  			idCheck.disabled=false;
  			idCheck.style.opacity=1;
  			idCheck.style.cursor="pointer";
		} 
  		*/
		
	</script>
	
	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<script type="text/javascript" >
	
		
	</script>
</body>
</html>


