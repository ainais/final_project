<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Welcome To Korean Smart Translation Platform "KOPAGO"</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	
    <link rel="stylesheet" href="resources/cssopen-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    
    <link rel="stylesheet" href="resources/cssowl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">

    <link rel="stylesheet" href="resources/css/aos.css">

    <link rel="stylesheet" href="resources/css/ionicons.min.css">

    <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/icomoon.css">
    <link rel="stylesheet" href="resources/css/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
    $(function(){
		let currentURL = new URL(window.location);
		let urlParams = currentURL.searchParams;
		
		if(urlParams.get("messageText") != null){
	    	var messageText = urlParams.get("messageText");
	    	alert(messageText);
	    	// 회원정보 수정이 되었을 때, 재로그인으로 유도하기
	    	if(messageText == "정상적으로 업데이트에 성공했습니다."){
	    		location.href="login.do";
	    	}
		}
		$("#popularWord img").click(function(){
			alert("추후 연계페이지 추가");
		})
		
		$("#koSpan").css({"color":"red"})
		$("#pagoSpan").css({"color":"blue"})
		$("#welcomeSpan").css({"fontSize":"20px","color":"black","fontWeight":"bold"})
		$("#TranslationSpan").css({"fontSize":"20px","color":"black","fontWeight":"bold"})
		$("#myInfo").css({"fontSize":"20px","color":"blue","fontWeight":"bold"})
		$("#kopagoH2 a").css({"fontSize":"30px","color":"red","fontWeight":"bold"})
		$("#ftco-nav li a").css({"fontSize":"20px","color":"black","fontWeight":"bold"})
		$("#nowSpan").css({"fontSize":"20px","color":"red","fontWeight":"bold"})
		$("#popularWord img").css({"cursor":"pointer"})
		$("#hotFreeboard").css({"cursor":"pointer","color":"blue","fontWeight":"bold","fontSize":"20px"})

    }) // end of function
    </script>
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.do">KOPAGO</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item"><a href="index" class="nav-link">홈</a></li>
	        	<li class="nav-item"><a href="about" class="nav-link">회사소개</a></li>
	        	<li class="nav-item"><a href="translate" class="nav-link">번역하기</a></li>
	        	<li class="nav-item"><a href="community" class="nav-link">커뮤니티</a></li>
	        	<li class="nav-item"><a href="contact" class="nav-link">문의</a></li>
	          <!-- 	<li class="nav-item"><a href="mypage" class="nav-link">My page</a></li> -->
	          
	          <c:if test="${sessionScope.loginSession != null}">
	        		<li class="nav-item"><a href="myBoard.do"><span id="myInfo">내 정보</span></a></li>
	        	</c:if>
	        	<c:if test="${sessionScope.loginSession == null}">
	        		<li class="nav-item"><a href="login"></a></li>
	        	</c:if>
	          
	          	<!--관리자 page 로 전환 시 -->
	          	<!-- <li class="nav-item"><a href="adminIndex" class="nav-link">adminIndex</a></li> -->
	        </ul>
	        	<li></li>
	        	<li></li>
	        	<li></li>
	        	<li></li>
	        	<c:if test="${sessionScope.loginSession == null}">
	        		<a href="login"><button type="button" class="btn btn-outline-secondary btn-lg">Login</button></a>
	        	</c:if>
	        	<c:if test="${sessionScope.loginSession != null}">
	        		<a href="logout"><button type="button" class="btn btn-outline-secondary btn-lg">Logout</button></a>
	        	</c:if>
	        	<c:if test="${sessionScope.loginSession != null}">
	        	<a href="alarm.do">
	        	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
				  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
				</svg></a>
				</c:if>
	        	
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

    <section class="hero-wrap d-flex">
    	<div class="forth d-flex">
    		<div class="bg-after d-flex align-self-stretch" style="background-color:white"></div>
    		<div class="text">
    			<div class="desc pt-5">
	    			<span id="welcomeSpan">Welcome</span>
	    			<h1 class="mb-2"><span id="koSpan">KO</span><span id="pagoSpan">PAGO</span></h1>
	    			<h2 class="mb-3"><span id="TranslationSpan">Translation PlatForm</span></h2>
	    			<h2 class="mb-3" id="kopagoH2"><a href="about.do">회사 소개 및 번역 절차 보러가기!</a></h2>
	    			<!--  
	    			<p><a href="#" class="btn-custom py-3 pr-2">Get in touch</a></p>
	    			-->
    			</div>
    		</div>
    	</div>
    	<div class="third about-img" style="background-color:white">
    		 <div id="home" class="video-hero" style="margin-top:100px;margin-left:100px;height:600px; background-image: url(resources/images/main.png); background-size:cover; background-position: center center;">
    	</div>
        </div>
    </section><hr><br>
    
<!-- 표시창 -->
<section class="ftco-section ftco-counter" id="section-counter" style="background-image: url(resources/images/bg_3.jpg);" data-stellar-background-ratio="0.5">
    	<div class="container">
    		<div class="row d-md-flex align-items-center">
    			<div class="col-lg-4">
    				<div class="heading-section pl-md-5 heading-section-white">
	          	<div class="ftco-animate">
		            <h2 class="mb-6">홈페이지 데이터</h2>
	            </div>
	          </div>
    			</div>
    			<div class="col-lg-8">
    				<div class="row d-md-flex align-items-center">
		          <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="${totalBoardCount }"></strong>
		                <span>총 번역 질문 갯수</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="${totalReplyCount }"></strong>
		                <span>총 답변 갯수</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="${totalTodayCount }"></strong>
		                <span>금일 질문 갯수</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="${totalWeekCount }"></strong>
		                <span>주간 질문 갯수</span>
		              </div>
		            </div>
		          </div>
	          </div>
          </div>
        </div>
    	</div>
    </section>
<!-- 표시창 종료 -->


<!-- 인기글 순위 -->
   <section class="ftco-section ftco-project" id="projects-section">
    	<div class="container-fluid px-4">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-lg-6 heading-section text-center ftco-animate">
          	<span class="subheading">BEST</span>
            <h2 class="mb-4">인기 번역단어 확인</h2>
          </div>
        </div>
    		<div class="row" id="popularWord">
				<img src="resources/wordCloud/wordCloud.png" style="margin-left:30%; width:40%;">
		    </div>
	   	</div>
    </section>
<!-- 인기글 순위 -->
<!--  중간 부분 -->   
    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
            <h2 class="mb-4">금일 <span style="color:red;font-weight:bold;">HOT</span> 조회수 글</h2>            
            <div class="pt-5 mt-5">
              <ul class="comment-list">
              
                <c:forEach items="${boardHotList }" var="boardHList">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="resources/images/kim.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>${boardHList.customerID }&nbsp;&nbsp;&nbsp;<c:if test="${boardHList.boardCount == null}">조회수 : 0</c:if><c:if test="${boardHList.boardCount != null}">조회수 : ${boardHList.boardCount}</c:if></h3>
                    <p><c:if test="${boardHList.boardContent == null}">음성 또는 이미지 번역 요청 파일입니다.</c:if><c:if test="${boardHList.boardContent == null}">${boardHList.boardContent }</c:if></p>
                    <div class="meta">${boardHList.uploadDate }</div>
                  </div>
                </li>
                <br><br>
                </c:forEach>
                
                <li class="comment">
                  <div class="vcard bio">
                    <input type="hidden">
                  </div>
                  <div class="comment-body">
                  	<hr><br>
                    <h3><a href="freeboard.do" id="hotFreeboard">다른 작성글 보러가기</a></h3>
                  </div>
                </li>
   			   </ul>
            </div>
          </div> <!-- .col-md-8 -->
          
          
          <!--검색어 입력창 시작-->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
             <!--  <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon icon-search"></span>
                  <input type="text" class="form-control" placeholder="검색어를 입력해주세요.">
                </div>
              </form> -->
            </div>
            <!-- 검색어 입력창 종료 -->
            
            
            
            
            <!-- 카테고리 창 시작 -->
            <div class="sidebar-box ftco-animate">
            	<h3>코파고 메뉴</h3>
              <ul class="category">
                <li><a href="">자유 게시판<span></span></a></li>
                <li><a href="#">오픈 채팅<span></span></a></li>
                <li><a href="#">등급 안내  <span></span></a></li>
                <li><a href="#">인기번역 글 확인<span></span></a></li>
              </ul>
            </div>
            <!-- 카테고리 창 종료 -->
            
            
            <!--인기 등급 순위-->
            <div class="sidebar-box ftco-animate">
              <h3>최근 답변 우수자</h3>
              <c:forEach items="${rankList }" var="rank">
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(resources/images/lee.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">${rank.customerID } 님</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> 보유중인 Star : ${rank.star }</a></div>
                    <div><a href="#"><span class="icon-person"></span> 현재 등급 : ${rank.starGrade }</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 이분께 번역요청하기</a></div>
                  </div>
                </div>
              </div>
              </c:forEach>

            </div>
            <!--인기번역 순위 종료-->
           
          </div>
          <!-- 태그창 종료-->
        </div>
      </div>
    </section> <!-- .section -->


    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5 d-flex">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">KOPAGO</h2>
              <p>한국소프트웨어 인재 개발원의 빅데이터반의 수강생들이 모여 열심히 구축한 인공지능 번역플랫폼입니다.</p>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Usefull Links</h2>
              <ul class="list-unstyled">
                <li><a href="index.do">홈</a></li>
                <li><a href="about.do">회사소개</a></li>
                <li><a href="translate.do">번역하기</a></li>
                <li><a href="community.do">커뮤니티</a></li>
                <li><a href="contact.do">문의하기</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">빠른 링크</h2>
              <ul class="list-unstyled">
                <li><a href="textService.do">글 번역 요청</a></li>
                <li><a href="imgService.do">이미지 번역 요청</a></li>
                <li><a href="voiceService.do">음성 번역 요청</a></li>
                <li><a href="openChat.do">오픈채팅방</a></li>
                <li><a href="faq.do">FAQ</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">질문이 있으신가요?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">서울특별시 금천구 가산동 426-5 월드 메르디앙 벤처 센터 2 차</span></li>
	                <li><a href="contact.do"><span class="icon icon-phone"></span><span class="text">+82) 10 8667 8148</span></a></li>
	                <li><a href="contact.do"><span class="icon icon-envelope"></span><span class="text">kou8148@naver.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
      </div>
    </footer>

  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/jquery.easing.1.3.js"></script>
  <script src="resources/js/jquery.waypoints.min.js"></script>
  <script src="resources/js/jquery.stellar.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/aos.js"></script>
  <script src="resources/js/jquery.animateNumber.min.js"></script>
  <script src="resources/js/jquery.mb.YTPlayer.min.js"></script>
  <script src="resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="resources/js/google-map.js"></script>
  <script src="resources/js/main.js"></script>
    
  </body>
</html>