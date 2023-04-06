<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>customerlist</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/mypage2/css/modify.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
		
		// ********* 포인트 커서로 바꾸기
		$(function(){
			//==============================================================
			  //포인트 커서
			
			// ==============================================================
			$('#modifyButton').click(function(){
				// var temp = $("#customerID").text();
				// alert(temp)
				var modifyText = $("#modifyButton").text();
				
				if(modifyText == '회원정보 수정'){
					// *********
					$('#address').html('<input type="text" id="addressText" value='+$("#address").text()+'>');
					$('#phone').html('<input type="text" id="phoneText" value='+$("#phone").text()+'>');
					$('#email').html('<input type="text" id="emailText" value='+$("#email").text()+'>');
					$('#gender').html('<input type="text" id="genderText" value='+$("#gender").text()+'>');
					
					let jobValue = $("#jobValue").val();
					
					let jobHtml = '<select name="job" id="jobText" class="btn btn-lg py-2 btn-success" style="width:400px;height:50px">';
						if(jobValue == 0){jobHtml += '<option value=0 selected>경영,사무,금융,보험</option>';} else{jobHtml += '<option value=0 selected>경영,사무,금융,보험</option>';}
						if(jobValue == 1){jobHtml += '<option value=1 selected>연구직 및 공학기술직</option>';} else{jobHtml += '<option value=1>연구직 및 공학기술직</option>';	}
						if(jobValue == 2){jobHtml += '<option value=2 selected>교육,법률,사회복지,경찰,소방</option>';} else{jobHtml += '<option value=2>교육,법률,사회복지,경찰,소방</option>';}
						if(jobValue == 3){jobHtml += '<option value=3 selected>보건,의료</option>';} else{jobHtml += '<option value=3>보건,의료</option>';}
						if(jobValue == 4){jobHtml += '<option value=4 selected>예술,디자인,방송,스포츠</option>';} else{jobHtml += '<option value=4>예술,디자인,방송,스포츠</option>';}
						if(jobValue == 5){jobHtml += '<option value=5 selected>학생</option>';} else{jobHtml += '<option value=5>학생</option>';}
						if(jobValue == 6){jobHtml += '<option value=6 selected>무직</option>';} else{jobHtml += '<option value=6>무직</option>';}
						if(jobValue == 7){jobHtml += '<option value=7 selected>기타</option></select>';} else{jobHtml += '<option value=7>기타</option></select>';}
					
					
					$('#job').html(jobHtml);
					
					$("#modifyButton").text('회원정보 수정 중')
				} // end of modifyText if 
				else if(modifyText == '회원정보 수정 중'){
					// ajax가 들어가서 db와 연동하면서 실제 내용을 바꾸기
		 			$.ajax({
						type:"post",
						url:"ajaxMypageModify.do",
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						data:{
							// *******여기에 넘길 데이터들 추가
							phone : $('#phoneText').val(),
							address : $('#addressText').val(),
							email : $('#emailText').val(),
							gender : $('#genderText').val(),
							job : $('#jobText').val()
						},
						success:function(message){
							location.href="index.jsp?messageText="+message;
						}
					}) // end of ajax 

					modifyText = $("#modifyButton").text('회원정보 수정')
					
					// location을 index로 바꾸면서 alert로 재 로그인이 필요합니다.
				} // end of else if
			}) // end of modifyButton click
			// ==============================================================
			var cnt = 0;
			// ==============================================================
			$('#deleteButton').click(function(){
				cnt++;
				if(cnt == 1){
				// 동적으로 버튼이랑 이런것들을 만든 것
				$('#deleteDiv').append("<br><br><hr><div>"+"회원 탈퇴를 하기 위해서는 비밀번호 확인이 필요합니다."+"</div>")
				// 크기 좀 조정하기
				$('#deleteDiv').append("<br><div><input type='text' id='ajaxConfirmDelete' placeholder='비밀번호 확인이 필요합니다.'></div>")
				$('#deleteDiv').append("<br><div><input type='button' id='ajaxConfirmDeleteButton' value='회원 탈퇴 신청하기'></div>")		
				}
				else{
					alert("이미 비밀번호 확인이 진행중입니다.");
				}
			}) // end of button
			// ==============================================================
				
			// ==============================================================
				// 동적으로 만든 버튼을 클릭 이벤트로 사용할 수 있도록 동적으로 만들기
			$(document).on("click",'#ajaxConfirmDeleteButton',function(){
				// ajax가 들어가서 db와 연동하면서 비밀번호를 넘기고 이 값이 DB값과 일치하면 회원 삭제 진행
	 		       $.ajax({
					type:"post",
					url:"ajaxMypagedelete.do",
					data:{
						// *******여기에 넘길 데이터들 추가
						passwd : $('#ajaxConfirmDelete').val()
					},
					success:function(message){
						location.href="index.jsp?messageText="+message;
					}
				}) // end of ajax */
			})
		// end of else if
	 // end of modifyButton click
			// ==============================================================
		}) // end of function
		</script>
	</head>
<body>
<c:if test="${sessionScope.loginSession == null }">
세션이 만료되었습니다.
<a href="login">로그인하러가기</a>
</c:if>
<c:if test="${sessionScope.loginSession != null }">
<!-- 메인 바디 시작 -->
<div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">회원정보</h2>
          <p class="exTxt">회원정보</p>
          <div class="join_form">
            <table>
              <colgroup>
                <col width="20%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>아이디</span></th>
                  <td id="customerID">${sessionScope.loginSession.customerID}</td>
                </tr>
                <tr>
                  <th><span>이름</span></th>
                  <td id="name">${sessionScope.loginSession.name}</td>
                </tr>
                <tr>
                  <th><span>생일</span></th>
                  <td id="birth">${sessionScope.loginSession.birthday}</td>
                </tr>                 
                <tr>
                  <th><span>성별</span></th>
                  <td id="gender">${sessionScope.loginSession.gender}</td>
                </tr>               
                <tr>
                  <th><span>이메일</span></th>
                  <td id="email">${sessionScope.loginSession.email}</td>
                </tr>
                <tr>
                  <th><span>주소</span></th>
                  <td id="address">${sessionScope.loginSession.address}</td>
                </tr>
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td id="phone">${sessionScope.loginSession.phone}</td>
                </tr>
                <tr>
                  <th><span>직업</span></th>
                  <td id="job">
                  <input type="hidden" value="${sessionScope.loginSession.job}" id="jobValue">
                  
                  <c:if test="${sessionScope.loginSession.job == 0}">경영,사무,금융,보험</c:if>
                  <c:if test="${sessionScope.loginSession.job == 1}">연구직 및 공학기술직</c:if>
                  <c:if test="${sessionScope.loginSession.job == 2}">교육,법률,사회복지,경찰,소방</c:if>
                  <c:if test="${sessionScope.loginSession.job == 3}">보건,의료</c:if>
                  <c:if test="${sessionScope.loginSession.job == 4}">예술,디자인,방송,스포츠</c:if>
                  <c:if test="${sessionScope.loginSession.job == 5}">학생</c:if>
                  <c:if test="${sessionScope.loginSession.job == 6}">무직</c:if>
                  <c:if test="${sessionScope.loginSession.job == 7}">기타</c:if>
                  </td>
                </tr>                                 
              </tbody>
            </table>
          </div>
          <div class="btn_wrap">
            <a id="modifyButton">회원정보 수정</a>   
          </div>
          <div class="btn_wrap" id="deleteDiv">
            <a id="deleteButton">회원 탈퇴</a>   
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
<!-- 메인 바디 종료 -->
</c:if>
</body>
</html>