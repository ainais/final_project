<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Whitespace - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
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
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

a {
	text-decoration: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="freeboard?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	$(function(){
		$("#heartIcon svg").click(function(){
			var boardID = $(this).parents("tr#likeBoardTR").find("#likeBoardID").text();
			
		     $.ajax({
		         url:"ajaxBoardLike.do",
		         type:"post",
		         contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		         data:{
		        	 boardID:boardID
		        	 },
		         success:function(message){
		            alert(message);
		            if(message == "로그인이 필요합니다."){
		            	location.href="login.do";
		            }
		         }
		      }) // end of ajax

		}) // end of heart click
		$("#clickHere").css({"color":"blue","fontWeight":"bold","fontSize":"30px"})
	}) // end of function
</script>
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
					<li class="nav-item "><a href="mypage" class="nav-link">내 정보</a></li>
					<!--    	<li class="nav-item"><a href="adminIndex" class="nav-link">adminIndex</a></li> -->
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
	<section class="hero-wrap hero-wrap-2 d-flex"
		style="background-image: url(images/bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row d-flex align-items-center">
				<div
					class="col-md-7 col-sm-12 ftco-animate text-bread d-flex align-items-center">
					<div class="text">
						<h1 class="mb-3 mt-5 bread">커뮤니티</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="community">홈</a></span> <span>커뮤니티</span>
						</p>
						<a href="freeboard" class="nav-link">자유게시판</a> <a
							href="openChat" class="nav-link">오픈 채팅방</a> <a
							href="boardInfo" class="nav-link">게시판 안내</a> 
							<!-- <a href="create"
							class="nav-link">게시글 작성</a> -->
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Begin Page Content -->
<body>
	<h2>게시판</h2>

	<div id="outter">
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
					보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
					보기</option>
			</select>
		</div>
	</div>

	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">자유 게시판 [번역 요청]</h1>
		<p class="mb-4">
			자유롭게 번역을 요청할 수 있는 공간입니다. 만약 번역 절차에 대해 알고 싶다면 
			<a target="_blank" href="about.do" id="clickHere">여기</a>를 클릭하세요
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<!-- 검색기능 -->
			<form action="searchFreeboard.do">
			<div style="display: block; text-align: center;">
				<table class="table table-bordered" id="searchTable" cellspacing="0">
					<tr>
						<td><select name="searchName">
								<option value="customerID">작성자</option>
								<option value="boardTitle">글제목</option>
						</select></td>
	
						<td><input type="hidden"></td>
	
						<td>
						<input type="text" id="searchText" name="searchValue" placeholder="검색 명을 입력해주세요">
						</td>
						 
						<td><input type="submit" value="검색"></td>
						</tr>
				</table>
			</div>
			</form> 
			
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-dark">게시판</h6>
			</div>
			<div class="card-body">
			<div>
	
			</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" cellspacing="0">
						<thead>
							<tr style="text-align:center">
								<th>게시판번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th colspan="2">좋아요</th>
							</tr>
						</thead>
						
						<c:forEach var="boardVO" items="${viewAll}">
							<tr id="likeBoardTR" style="text-align:center">
								<td id="likeBoardID"><c:out value="${boardVO.boardID}" /></td>
								<td>
								<!-- 비공개 처리에 대한 코드 시작 -->
								<c:if test="${boardVO.boardSecret == '공개'}" >
								<a href="boardlists?boardID=${boardVO.boardID }">
								<c:if test="${boardVO.boardTitle == null}">제목 없음</c:if>
								<c:if test="${boardVO.boardTitle != null}"><c:out value="${boardVO.boardTitle}" /></c:if>
								</a>
								</c:if>
								
								<c:if test="${boardVO.boardSecret == '비밀'}" >
									<c:if test="${sessionScope.loginSession.customerClassification != '관리자'}">
									비공개 글입니다.
									</c:if>
									
									<c:if test="${sessionScope.loginSession.customerClassification == '관리자' }">
									<a href="boardlists?boardID=${boardVO.boardID }"><c:out value="${boardVO.boardTitle}" /></a>
									</c:if>
									
									<!-- 작성자 본인일 경우 추가 -->
									 <c:if test="${sessionScope.loginSession.customerID == boardVO.customerID }">
									<a href="boardlists?boardID=${boardVO.boardID }"><c:out value="${boardVO.boardTitle}" /></a>
									</c:if>
								</c:if> 
								<!-- 비공개 처리에 대한 코드 종료 -->
								</td>
								
								<td><c:out value="${boardVO.customerID}" /></td>
								<td><c:out value="${boardVO.uploadDate}" /></td>
								<td><c:out value="${boardVO.boardCount}" /></td>
								<td><c:out value="${boardVO.boardLike}" /></td>
								<td style="text-align:center" id="heartIcon">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
								  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
								</svg>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<a href="create" class="btn btn-primary btn-lg text-dark">writing</a>
				</div>

				<div style="display: block; text-align: center;">
					<c:if test="${paging.startPage != 1 }">
						<a
							href="searchFreeboard?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchName=${searchName}&searchValue=${searchValue}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a
									href="searchFreeboard?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchName=${searchName}&searchValue=${searchValue}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a
							href="searchFreeboard?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchName=${searchName}&searchValue=${searchValue}">&gt;</a>
					</c:if>
				</div>
			

			</div>
		</div>
	</div>

	<%@include file="include/footer.jsp"%>