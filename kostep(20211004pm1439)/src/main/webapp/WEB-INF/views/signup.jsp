<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/loginfonts/icomoon/style.css">

    <link rel="stylesheet" href="resources/logincss/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/logincss/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="resources/logincss/style.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/loginjs/jquery-3.3.1.min.js"></script>
<script src="resources/loginjs/popper.min.js"></script>
<script src="resources/loginjs/bootstrap.min.js"></script>
<script src="resources/loginjs/main.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <title>Login #5</title>
 </head>
<script type="text/javascript">

var AuthenticationKey = "";
var emailcheckcnt = "N";



$(document).ready(function(){

	   
	//회원가입 버튼(회원가입시 빈칸없도록)
	var tempID = "";
    var checkCnt = 0;
    var getCheck= RegExp(/^[a-z0-9]{1,10}$/); //아이디유효성검사
    
	$("#signup").click(function(){
		if($.trim($('#customerID').val())==''){
			alert("아이디를 입력하세요");
			$('#costomerID').focus();
			return;
		}
		if(checkCnt == 0){
			alert("아이디체크를 해야합니다");
			return;
		}
		if($.trim($('#password').val())==''|| $.trim($("#reEnterpassword").val()) == ""){
			alert("비밀번호 입력하세요");
			$('#password').focus();
			return;
		}
		if($.trim($('#password').val())!=$.trim($('#reEnterpassword').val())){
			alert("재입력 비밀번호가 일치하지 않습니다.");
			$('#password').focus();	
		}
		if($('input[name=gender]:checked').val()== null || $('input[name=gender]:checked').val()==''){
			alert("성별을 선택하세요");
			$('#gender').focus();	
			return;
		}
		if($.trim($('#name').val())==''){
			alert("이름을 입력하세요");
			$('#gender').focus();	
			return;
		}
		if($.trim($('#birthday').val())==''){
			alert("생년월일을 입력하세요");
			$('#birthday').focus();		
			return;
		}
		if($.trim($('#phone').val())==''){
			alert("전화번호를 입력하세요");
			$('#phone').focus();
			return;
		}
		if($.trim($('#address1').val())==''){
			alert("주소를 입력하세요");
			$('#address1').focus();
			return;
		}
		$("#address").val($("#address1").val()+' '+$("#address2").val());
		if($.trim($('#job').val())==''){
			alert("직업을 선택하세요");
			$('#job').focus();	
			return;
		}
		if($.trim($('#email').val())==''){
			alert("이메일을 입력하세요");
			$('#email').focus();
			return;
		}
		if(emailcheckcnt == "N"){
			alert("이메일을 인증해주세요");
			return;
		}
		//사용가능한 아이디일 경우만 submit가능하도록 유도

		if(checkCnt > 0){
			if(tempID != $("#customerID").val()){
				alert("ID체크를 다시해야합니다 ");
				return;
			}else{
			
			$("#signupForm").attr("action", "signupForm");
			alert("회원가입이 완료되었습니다!");
			$("#signupForm").submit();

			}

		} // end of checkCnt

	 
	});
	//====================================================

    $("#idCheck").click(function() {
        // 1. 공백 조건 제거
        if($("#customerID").val() == null || $("#customerID").val() == ""){
           alert("공백을 사용할 수 없습니다.");
           return false;
        }
        // 2. 한번은 중복검사를 실시해야 submit 가능
        checkCnt++;
        // 3 ID 최대 10글자 까지만 사용 가능
        if($("#customerID").val().length >= 10){
           alert("10글자 이상의 아이디는 사용할 수 없습니다.");
           return false;
        }
        // 4. id 형식에 맞게 유도하기 => getCheck
        if(!getCheck.test($("#customerID").val())){
           alert("아이디는 영어 소문자와 숫자만 사용할 수 있습니다.");
           return false;
        }else{
       	// 5.ajax DB와 아이디 검사
        $.ajax({
            type : 'POST',
            data : {customerID : $("#customerID").val()},
            contentType : "application/x-www-form-urlencoded;charset=UTF-8",
            url : "idCheck.do",	           
            success : function(message) {
      /*       	alert(message); */
                if (message == "1" ) {
                    $('#checkMsg').html("이미 등록된 아이디입니다.");
                    $('#checkMsg').attr('color', '#f82a2aa3');
                    $("#customerID").focus();               
                } 
                else {
                	$('#checkMsg').html("사용가능한 아이디입니다.");
                	$('#checkMsg').attr('color', '#199894b3');
                	tempID = $("#customerID").val();
                    $("#passwd").focus();
                    
                    
                }
            },
            error : function(error) {
                alert("error : " + error);
            } // end of error
        }); // end of ajax
        
        } 

    	});

	    // ==================================
	    // 비밀번호 일치 실험 시작
	    $('#password').keyup(function(){
		      $('#chkNotice').html('');
		    });

		    $('#reEnterpassword').keyup(function(){

		        if($('#password').val() != $('#reEnterpassword').val()){
		          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
		          $('#chkNotice').attr('color', '#f82a2aa3');
		        } else{
		          $('#chkNotice').html('비밀번호 일치함<br><br>');
		          $('#chkNotice').attr('color', '#199894b3');
		        }

		    });
	    // 비밀번호 일치 실험 종료

	    
}) // end of function
//====================
//다음주소찾기 api 
function findAddr() {
	new daum.Postcode({
	oncomplete: function(data) {
		console.log(data);
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var roadAddr = data.roadAddress; // 도로명 주소 변수
        var jibunAddr = data.jibunAddress; // 지번 주소 변수
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
       // document.getElementById('member_post').value = data.zonecode;
        if(roadAddr !== ''){
            document.getElementById("address1").value = roadAddr;
        } 
        else if(jibunAddr !== ''){
            document.getElementById("address1").value = jibunAddr;
        }
    }
		
	}).open();
}

//==================================
//이메일연동    
function emailcheck() {

    $.ajax({
        type : 'POST',
        data : {email : $("#email").val()},
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
        url : "sendemail.do",	           
        success : function(data) {
           	AuthenticationKey = data;  //맨위에 전역변수에 담아준다.
           	alert("인증번호를 보냈습니다.");
        } ,
        error : function(error) {
            alert("error : " + error);
        } // end of error
    }); // end of ajax
}
function authcheck(){
	if(AuthenticationKey == $("#emailauth").val()){
		emailcheckcnt = "Y";
		alert("인증되었습니다.")
	}else{
		alert("인증번호가 다릅니다.")
		return false;
	}
		
}
</script>
  <body>

  

  <div class="d-md-flex half">
    <div class="bg" style="background-image: url('resources/loginimg/bg_1.jpg');"></div>
    <div class="contents">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12">
            <div class="form-block mx-auto">
              <div class="text-center mb-5">
                <h3 class="text-uppercase">Sign up for <strong>KOPAGO</strong></h3>
              </div>
              <form action="" id="signupForm" method="post">
                <div class="form-group first">
                  <label for="customerID">Login ID</label>
                  <input type="text" class="form-control" placeholder="Login ID" id="customerID" name="customerID">
                 <input type="button" value="ID Check" class="btn btn-primary" id="idCheck" >
                 &nbsp;
                 &nbsp;
                 &nbsp;
                 &nbsp;
                 &nbsp;
                 &nbsp;
                 
                 			<font id="checkMsg"></font>
							
                </div>
     
                <div class="form-group last mb-3">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" placeholder="Enter Password" id="password" name="passwd"><br>
                  <input type="password" class="form-control" placeholder="Re-Enter Password" id="reEnterpassword">
                  <font id="chkNotice" size="4"></font>
                </div>
                <div class="form-group last mb-3">
                <label for="gender">Gender</label><br>              
                  <input type='radio' name='gender' value='female' id="female" style="cursor: pointer"/>Female
                  &nbsp;
                  &nbsp;
                  &nbsp;
                  &nbsp;
                  &nbsp;
                  &nbsp;
                  &nbsp;
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  
 			 	  <input type='radio' name='gender' value='male' id="male" style="cursor: pointer"/>Male
 				</div>              
                <div class="form-group last mb-3">
                  <label for="name">Name</label>
                  <input type="text" class="form-control" placeholder="Name" id="name" name="name">
                </div>
                <div class="form-group last mb-3">
                  <label for="birthday">Birthday</label>
                  <input type="date" class="form-control" placeholder="Birthday" id="birthday" name="birthday">
                </div>

                <div class="form-group last mb-3">
                  <label for="phone">PhoneNumber</label>
                  <input type="text" class="form-control" placeholder="PhoneNumber" id="phone" name="phone">
                </div>
                <div class="form-group last mb-3">
                  <label for="address">Address</label>
                  <input id="address1" name="address1" class="form-control" type="text" placeholder="Address" readonly onclick="findAddr()">
                  <input id="address2" name="address2" class="form-control" type="text" placeholder="detailAddress" >
                  <input id="address" name="address"  type="hidden" >
                </div>
                 <div class="form-group last mb-3">
                  <label for="job">Job</label><br>
                 <select name="job" id="job" class="btn btn-lg py-2 btn-success">
    				<option value="" selected="selected">직업선택</option>
    				<option value=0>경영,사무,금융,보험</option>
    				<option value=1>연구직 및 공학기술직</option>   				
    				<option value=2>교육,법률,사회복지,경찰,소방</option>
    				<option value=3>보건,의료</option>
    				<option value=4>예술,디자인,방송,스포츠</option>
    				<option value=5>학생</option>
    				<option value=6>무직</option>
    				<option value=7>기타</option>
				</select>
                </div>   
                <div class="form-group last mb-3">
                  <label for="email">Email</label>
                  <input type="email" class="form-control" placeholder="Email" id="email" name="email">
                  <button type="button" onclick="emailcheck();"  class="btn btn-primary">인증번호전송</button>
                  <input type="text" class="form-control" placeholder="Enter Key" id="emailauth" >
                  <button type="button" onclick="authcheck();"  class="btn btn-primary">인증번호확인</button>
                </div>            
                <div class="d-sm-flex mb-5 align-items-center">
                  <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">Agreement</span>
                    <input type="checkbox" checked="checked"/>
                    <div class="control__indicator"></div>
                  </label>
                  <span class="ml-auto"><a href="#" class="forgot-pass">약관</a></span> 
                </div>

                <input type="button" value="Sign up" id="signup" class="btn btn-block py-2 btn-success">

                
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    
  </div>

    
  </body>
</html>


<!-- section -->

 
