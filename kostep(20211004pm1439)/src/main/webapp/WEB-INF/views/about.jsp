<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Whitespace - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

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

<!-- 회사 소개 소스 -->
<style>
.infocontainer {
	display: flex;
	width: 100%;
	padding: 4% 2%;
	box-sizing: border-box;
	height: 100vh;
}

.box {
	flex: 1;
	overflow: hidden;
	transition: .5s;
	margin: 0 2%;
	box-shadow: 0 20px 30px rgba(0, 0, 0, .1);
	line-height: 0;
}

.box>img {
	width: 100%;
	height: calc(100% - 10vh);
	object-fit: cover;
	transition: .5s;
}

.box>span {
	font-size: 3.8vh;
	display: block;
	text-align: center;
	height: 10vh;
	line-height: 2.6;
}

.box>.span2 {
	font-size: 3.8vh;
	display: block;
	text-align: center;
	height: 10vh;
	line-height: 2.6;
}
.box:hover {
	flex: 1 1 50%;
}

.box:hover>img {
	width: 60%;
	height: 60%;
	
}

.red {
	color : red;
}	
.blue {
	color : blue;
}	
#subtitle {
	font-weight : bold;
	
}
</style>

</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index">KOPAGO</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> 메뉴
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item "><a href="index" class="nav-link">홈</a></li>
					<li class="nav-item "><a href="about" class="nav-link">회사소개</a></li>
					<li class="nav-item "><a href="translate" class="nav-link">번역하기</a></li>
					<li class="nav-item "><a href="community" class="nav-link">커뮤니티</a></li>
					<li class="nav-item "><a href="contact" class="nav-link">문의</a></li>

					<!--    	<li class="nav-item"><a href="adminIndex" class="nav-link">adminIndex</a></li> -->

					<c:if test="${sessionScope.loginSession != null}">
						<li class="nav-item"><a href="mypage">내 정보</a></li>
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
					<a href="login"><button type="button"
							class="btn btn-outline-warning btn-lg">Login</button></a>
				</c:if>
				<c:if test="${sessionScope.loginSession != null}">
					<a href="logout"><button type="button"
							class="btn btn-outline-warning btn-lg">Logout</button></a>
				</c:if>

			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 d-flex">
		<!-- style="background-image: url(resources/images/bg_2.jpg);" -->
	
		<div class="overlay"></div>
		<div class="container">
			<div class="row d-flex align-items-center">
				<div
					class="col-md-7 col-sm-12 ftco-animate text-bread d-flex align-items-center">
					<div class="text">
						<h1 class="mb-3 mt-5 bread">회사 소개</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="about">홈</a></span> <span>회사소개</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	

		<section class="ftco-section ftco-partner">
		<div class="container">
			<div class="row">
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img
						src="resources/images/photo/yolo.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img
						src="resources/images/photo/python.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img
						src="resources/images/photo/keras.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img
						src="resources/images/photo/colab.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img
						src="resources/images/photo/spring.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
			</div>
		</div>
		<!-- one more -->
		<div class="row">띄</div>
		<div class="row">우</div>
		<div class="row">자</div>
		
		
		<div class="container">
			<div class="row">
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img
						src="resources/images/photo/tensor.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<p/>
					<p/>
					<a href="#" class="partner">
					<img
						src="resources/images/photo/opencv_logo.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img
						src="resources/images/photo/jupyter.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img
						src="resources/images/photo/konlpy.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-sm ftco-animate">
					<a href="#" class="partner"><img
						src="resources/images/photo/bootstrap.png" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
			</div>
		</div>
		
	</section>


	<div class="infocontainer">
	<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<span class="subheading">KOPAGO</span>
					<h2 class="mb-5">NEXT LEVEL</h2>
					<h3><p>Our Technological Stacks</p></h3>
				</div>
			</div>
	
	
	
		<div class="box" id="box2">
			<img src="resources/images/photo/us.PNG"> <span class="font-weight-bold">전체 기술 스택</span>
			<span class="blue">여기 뭐 쓰지... 뭘 넣어도 어색함...<br/></span></h5>
		</div>
		<div class="box">
			<img src="resources/images/photo/rnn.png"> <span class="font-weight-bold">글번역 RNN</span>
			<div class="span2">
			<h5 class="font-weight-bold">
			<span class="blue">데이터 순서 정보를 반영하는 딥러닝 분석모델<br/></span></h5>
			<h5>
			1) AI hub 및 000에서 data set (corpus;말뭉치) 수집 <br/>
			2) KoNlPy를 통한 형태소 분석 및 <span class="red">tokenizer</span>를 활용한 단어 분류 <br/>
			3) 정규식 등을 활용하여 noise data 제거  <br/>
			4) <span class="red">KERAS 모델</span>을 활용한 번역기 model 훈련 <br/>
			5) 실시간 data crawling을 통한 data set 누적 => <span class="red">번역 정확도</span> 상승</h5>
			</div>
		</div>
		<div class="box">
			<img src="resources/images/photo/keras_multi.png"> <span class="font-weight-bold">이미지번역
			CNN</span>
			<div class="span2">
			<h5 class="font-weight-bold">
			<span class="blue">데이터의 특징을 추출 후 이를 기반으로 이미지를 분류하는 딥러닝 분석모델<br/></span></h5>
			<h5>
			1) MNIST data set (트레이닝 set, test set) 수집 <br/>
			2) YOLO V5를 통한  <span class="red">Object Detection</span>및 Data Parsing 작업<br/>
			3) <span class="red">자사의 KTT 모델</span>을 활용한 번역기 훈련 <br/> <br/>
			4) 실시간 data crawling을 통한 data set 누적 => <span class="red">번역 정확도</span>상승</h5> 
			</div>
		</div>
		<div class="box">
			<img src="resources/images/photo/brain.png"> <span class="font-weight-bold">딥러닝</span>
			<div class="span2">
			<h5 class="font-weight-bold">
			<span class="blue"><br/>인간의 뉴런과 비슷한 인공신경망 방식으로 정보를 처리</span></h5>
			<h5>
			데이터의 특징과 패턴을 파악하거나, 순서를 익힐 수 있는 데이터 학습에 활용 <br/>
			</h5>
			</div>
		</div>
	</div>
	
	
	
	
	
	

	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row no-gutters">
				<div
					class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center order-md-last"
					style="background-image: url(resources/images/about.jpg);"></div>
				<div class="col-md-7 wrap-about pt-md-5 ftco-animate">
					<div class="heading-section mb-5 pt-5 pl-md-5">
						<div class="pr-md-5 mr-md-5 text-md-right">
							<span class="subheading">KOPAGO</span>
							<h2 class="mb-4">회사소개</h2>
						</div>
					</div>
					<div class="pr-md-3 pr-lg-5 pl-md-5 mr-md-5 mb-5">
						<div class="services-wrap d-flex">
							<div
								class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-innovation"></span>
							</div>
							<div
								class="media-body pl-md-0 pl-4 pr-4 order-md-first text-md-right">
								<h3 class="heading" id="subtitle">편리한 회원가입</h3>
								<p> NAVER 아이디만 있어도 언제든 쉽고 편리하게 가입할 수 있습니다.</p>
							</div>
						</div>
						<div class="services-wrap d-flex">
							<div
								class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-innovation"></span>
							</div>
							<div
								class="media-body pl-md-0 pl-4 pr-4 order-md-first text-md-right">
								<h3 class="heading" id="subtitle">전문적인 번역</h3>
								<p>어떠한  질문이든 성심성의껏 전문적인 번역을 도와드립니다.</p>
							</div>
						</div>
						<div class="services-wrap d-flex">
							<div
								class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-innovation"></span>
							</div>
							<div
								class="media-body pl-md-0 pl-4 pr-4 order-md-first text-md-right">
								<h3 class="heading" id="subtitle">자유로운 소통공간</h3>
								<p>오픈 채팅으로 전 세계인과 자유롭게 소통할 수 있습니다.</p>
							</div>
						</div>
						<div class="services-wrap d-flex">
							<div
								class="icon d-flex justify-content-center align-items-center">
								<span class="flaticon-innovation"></span>
							</div>
							<div
								class="media-body pl-md-0 pl-4 pr-4 order-md-first text-md-right">
								<h3 class="heading" id="subtitle">24시간 고객센터</h3>
								<p>고객의 소리를 듣기 위해 KOPAGO 고객센터는 늘 열려 있습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<span class="subheading">KOPAGO</span>
					<h2 class="mb-5">NEXT LEVEL</h2>
					<p>DON'T WORRY BE SMART!!!!!</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff text-center">
						<div class="img"
							style="background-image: url(resources/images/lee.jpg);"></div>
						<div class="text pt-4">
							<h3>이정성</h3>
							<span class="position mb-2">PL</span>
							<p>컴퓨터는 잘못없습니다.잘못한건 그걸 입력한 당신~!(빛)</p>
							<ul class="ftco-social">
								<li class="ftco-animate"><a href="#"><span
										class="icon-twitter"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-facebook"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-google-plus"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-instagram"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff text-center">
						<div class="img"
							style="background-image: url(resources/images/ha.jpg);"></div>
						<div class="text pt-4">
							<h3>염하늘</h3>
							<span class="position mb-2">PM</span>
							<p>하루 일정과 해야할일을 잘 정해주는 존재</p>
							<ul class="ftco-social">
								<li class="ftco-animate"><a href="#"><span
										class="icon-twitter"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-facebook"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-google-plus"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-instagram"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff text-center">
						<div class="img"
							style="background-image: url(resources/images/kim.jpg);"></div>
						<div class="text pt-4">
							<h3>김동현</h3>
							<span class="position mb-2">Developer</span>
							<p>막혀도 해결해보자 해낼때까지</p>
							<ul class="ftco-social">
								<li class="ftco-animate"><a href="#"><span
										class="icon-twitter"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-facebook"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-google-plus"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-instagram"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff text-center">
						<div class="img"
							style="background-image: url(resources/images/tae.jpg);"></div>
						<div class="text pt-4">
							<h3>김태현</h3>
							<span class="position mb-2">Developer</span>
							<p>오야지~~~~오야지~~~~~</p>
							<ul class="ftco-social">
								<li class="ftco-animate"><a href="#"><span
										class="icon-twitter"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-facebook"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-google-plus"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-instagram"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="staff text-center">
						<div class="img"
							style="background-image: url(resources/images/ju.jpg);"></div>
						<div class="text pt-4">
							<h3>주현길</h3>
							<span class="position mb-2">Developer</span>
							<p>묵묵히 해야할일 다끝낸다</p>
							<ul class="ftco-social">
								<li class="ftco-animate"><a href="#"><span
										class="icon-twitter"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-facebook"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-google-plus"></span></a></li>
								<li class="ftco-animate"><a href="#"><span
										class="icon-instagram"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					
				</div>

			</div>
		</div>
	</section>

	<%@include file="include/footer.jsp"%>