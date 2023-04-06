<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Whitespace - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

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
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index">KOPAGO</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
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
	        		<a href="login"><button type="button" class="btn btn-outline-warning btn-lg">Login</button></a>
	        	</c:if>
	        	<c:if test="${sessionScope.loginSession != null}">
	        		<a href="logout"><button type="button" class="btn btn-outline-warning btn-lg">Logout</button></a>
	        	</c:if>
	        	
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->