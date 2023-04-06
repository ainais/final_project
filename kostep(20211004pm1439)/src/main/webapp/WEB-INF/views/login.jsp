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

    <title>Login #5</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
    $(function(){
    	if("${failLogin}" != null){
    		if("${failLogin}" != ""){    			
    			alert("${failLogin}")    		
    		}
    	} // end of login 실패 알람
    	var getCheck= RegExp(/^[a-z0-9]{1,10}$/);
    	$("#loginButton").click(function(){

    		if($("#username").val() == null || $("#username").val() == ""){
    			alert("아이디를 입력해야합니다.");
    			return;
    		}
    		if($("#password").val() == null || $("#password").val() == ""){
    			alert("비밀번호를 입력해야합니다.");
    			return;
    		}
    		if(!getCheck.test($("#username").val())){
    			alert("유효하지 않은 문자를 입력하셨습니다.=>영어소문자 + 숫자만 사용 가능");
    			return;
    		}
    		
        	$("#loginConfirm").submit();
    	}) // end of loginButton
    	
    	
    }) // end of function
    </script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
  </head>
  <body>
  

  <div class="d-md-flex half">
    <div class="bg" style="background-image: url('resources/loginimg/bg_1.jpg');"></div>
    <div class="contents">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12">
            <div class="form-block mx-auto">
              <div class="text-center mb-5">
                <h3 class="text-uppercase">Login to <strong>KOPAGO</strong></h3>
              </div>
              <form action="loginConfirm" method="post" id="loginConfirm">
                <div class="form-group first">
                  <label for="username">Username</label>
                  <input type="text" class="form-control" placeholder="your-email@gmail.com" id="username" name="customerID">
                </div>
                <div class="form-group last mb-3">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" placeholder="Your Password" id="password" name="passwd">
                </div>
                
                <div class="d-sm-flex mb-5 align-items-center">
                  <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">Remember me</span>
                    <input type="checkbox" checked="checked"/>
                    <div class="control__indicator"></div>
                  </label>
                  <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                </div>

                 <input type="button" value="Log In" class="btn btn-block py-2 btn-primary" id="loginButton">

                <span class="text-center my-3 d-block">or</span>
                
                
                <div class="">
                <div id="naverIdLogin"></div>

                <script type="text/javascript">
					var naverLogin = new naver.LoginWithNaverId(
						{
							clientId: "ACmnadaTtLt9Y_14Mg4u",
							callbackUrl: "http://localhost:8081/kostep/callBack.do",
							isPopup: false, /* 팝업을 통한 연동처리 여부 */
							loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
						}
					);
					
					/* 설정정보를 초기화하고 연동을 준비 */
					naverLogin.init();
					
				</script>
                <a href="signup" class="btn btn-block py-2 btn-facebook">
                  <!-- <span class="icon-facebook mr-3"></span> --> Create New Account?
                </a>
                </div>
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    
  </div>

    <script src="resources/loginjs/jquery-3.3.1.min.js"></script>
    <script src="resources/loginjs/popper.min.js"></script>
    <script src="resources/loginjs/bootstrap.min.js"></script>
    <script src="resources/loginjs/main.js"></script>
  </body>
</html>


<!-- section -->

