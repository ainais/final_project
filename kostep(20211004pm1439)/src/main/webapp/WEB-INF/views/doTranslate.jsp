<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="Colorlib">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>CellOn</title>

	<link href="https://fonts.googleapis.com/css?family=Poppins:100,300,500" rel="stylesheet">
		<!--
		CSS
		============================================= -->
		<link rel="stylesheet" href="resources/doTranslate/css/linearicons.css">
		<link rel="stylesheet" href="resources/doTranslate/css/owl.carousel.css">
		<link rel="stylesheet" href="resources/doTranslate/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/doTranslate/css/nice-select.css">
		<link rel="stylesheet" href="resources/doTranslate/css/magnific-popup.css">
		<link rel="stylesheet" href="resources/doTranslate/css/bootstrap.css">
		<link rel="stylesheet" href="resources/doTranslate/css/main.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
		$(function(){
			$("#translateButton").click(function(){
				alert("hello")
				
				// submit 추가
			}) // end of trnaslateButtonClick
		}) // end of function
		</script>
	</head>
	<body>
	<div class="oz-body-wrap">
		<!-- Start Banner Area -->
		<section class="banner-area relative">
			<div class="container">
				<div class="row fullscreen align-items-center justify-content-center">
					<div class="banner-left col-lg-6">
						<img class="d-flex mx-auto img-fluid" src="${imageLink }" alt="">
					</div>
					<div class="col-lg-6">
						<div class="story-content">
							<h6 class="text-uppercase">${imageTextData }</h6>
							<br><hr>
							<a href="#" id="translateButton" class="genric-btn primary circle arrow">번역 실행하기</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Banner Area -->

	</div>

		<script src="resources/doTranslate/js/vendor/jquery-2.2.4.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
		<script src="resources/doTranslate/js/vendor/bootstrap.min.js"></script>
		<script src="resources/doTranslate/js/jquery.ajaxchimp.min.js"></script>
		<script src="resources/doTranslate/js/owl.carousel.min.js"></script>
		<script src="resources/doTranslate/js/jquery.nice-select.min.js"></script>
		<script src="resources/doTranslate/js/jquery.magnific-popup.min.js"></script>
		<script src="resources/doTranslate/js/jquery.counterup.min.js"></script>
		<script src="resources/doTranslate/js/waypoints.min.js"></script>
		<script src="resources/doTranslate/js/main.js"></script>
	</body>
</html>
