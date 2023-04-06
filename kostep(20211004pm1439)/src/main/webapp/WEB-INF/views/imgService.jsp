<%@include file="include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Whitespace - Free Bootstrap 4 Template by Colorlib</title>
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
    	$("#imageUploadButton").click(function(){
    		var temp = $("#image_uploads").val();
    		
    		$("#imageUploadForm").submit();
    	}) // end of 이미지 업로드 버튼 클릭
    }) // end of function
    </script>
  </head>
  <body>

<section class="hero-wrap hero-wrap-2 d-flex">
	<!-- style="background-image: url(resources/images/bg_2.jpg);" -->
	<div class="overlay"></div>
	<div class="container">
		<div class="row d-flex align-items-center">
			<div
				class="col-md-7 col-sm-12 ftco-animate text-bread d-flex align-items-center">
				<div class="text">
					<h1 class="mb-3 mt-5 bread">번역하기</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="translate">홈</a></span> <span>번역하기</span>
					</p>
					<a href="textService" class="nav-link">글 번역</a> <a
						href="imgService" class="nav-link">이미지 번역</a> 
						<a href="voiceService" class="nav-link">음성 번역</a>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-project" id="projects-section">
	<div class="container-fluid px-4">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-lg-6 heading-section text-center ftco-animate">
				<span class="subheading">Projects</span>
				<h2 class="mb-4">이미지 번역하기</h2>
				<p>1.왼쪽에 이미지를 넣어주시고 텍스트로 변환하기를 눌러주세요!</p>
				<p>2.변환된 텍스트가 맞다면 하단에 번역하기 버튼을 눌러주세요!</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div
					class="project img ftco-animate d-flex justify-content-center align-items-center">
					<div class="overlay"></div>
					<a href="#"
						class="btn-site d-flex align-items-center justify-content-center"><span
						class="icon-subdirectory_arrow_right"></span></a>
					<div class="text text-center p-4">
						<!-- <a href="#">Upload Image you want to translate</a> -->
					</div>
					<div>
						<form action="imageUpload.do" method="post" enctype="multipart/form-data" id="imageUploadForm">
					
					<input type="file" id="image_uploads" name="file"
								accept=".jpg, .jpeg, .png" multiple />
						</form>
					</div>
					<br>
					<div class="preview">
						<p><h3>No files uploaded</h3></p>
					</div>
					<div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					</div>
					<!-- 	</form> -->
				</div>
			</div>
						
			<div class="col-md-8">
			<br><br><br><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-success btn-lg" id="imageUploadButton">이미지 텍스트로 변환하기</button>
			</div>
		</div>
	</div>
</section>
  </body>
  </html>
<%@include file="include/footer.jsp"%>