<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
	<h3>회원 가입하기</h3>
	<hr>
		<%-- <form name="frmMember" action="${contextPath}/member/updateMember.do"> --%>
			<form name="frmMember" action="${contextPath}/member/modifyForm.jsp">
			 <div class="mb-3">
				<label for="id" class="form-label" >아이디</label>
				<input type="text" class="form-control" name="id" id="id" >
			</div>
			<div>
				<a class="btn btn-success" id="id_check">아이디 중복확인</a>
			</div>
			<div class="mb-3">
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="password" class="form-control" name="pwd" id="pwd">
			</div> 

			<div class="mb-3">
				<label for="name" class="form-label">이름</label>
				<input type="text" class="form-control" name="name" id="name" >
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">이메일</label>
				<input type="email" class="form-control" name="email" id="email" >
			</div>
			
		</form>
			 <!-- Button trigger modal -->
			<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">가입하기</button> 		
   			<a class="btn btn-success" href="${contextPath}/member">목록</a>
			
	</div>
	<br>
	
<!-- 부트스트랩 모달 창 기능 자바스크립트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 정보 등록</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        가입하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-success" onclick="fn_sendMember();">가입</button>
      </div>
    </div>
  </div>
</div>


	<script type="text/javascript">
		function fn_sendMember(){
			//console.log('함수 호출');
			
			var frmMember = document.frmMember;
			
			var id = frmMember.id.value;
			var pwd = frmMember.pwd.value;
			var name = frmMember.name.value;
			var email = frmMember.email.value;
			
			console.log(id,pwd,email,name);
		 	if(id.length== 0 || id==""){
				alert("아이디는 필수입니다.")
				return false;
		 	}else if(pwd.length== 0 || pwd==""){
				alert("비밀번호는 필수입니다.")
				return false;
			}else if(email.length== 0 || email==""){
				alert("이메일은 필수입니다.")
				return false;
			}
			
			/* var modify_ok=confirm("수정하시겠습니까?");
			console.log(modify_ok); */
			
			//if(modify_ok){
				frmMember.method = "post";
				frmMember.action = "/projectS/member"; //서블릿 요청
				//frmMember.action = "/projectS/member/member1.jsp";
				frmMember.submit(); // 전송(요청)
			//}
			/* else{
				location.reload();
			} */
		}
	</script>
	
	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<script type="text/javascript" >
		$(function() {
			console.log('jQuery ok')
			$('#id_check').click((e)=>{
				e.preventDefault();
				console.log('아이디 중복 확인');
			});
		});
	</script>
</html>