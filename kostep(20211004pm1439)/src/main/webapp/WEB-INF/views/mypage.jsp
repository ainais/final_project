<%@include file="include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/mypage/mypage.css">
<title>마이페이지</title>
</head>
<body>
<div class="wrap">
  <div class="greenContainer">
    <div>
      <div class="grade">${sessionScope.loginSession.name }님</div>
      <div class="name">마이페이지</div>
    </div>       
  </div>

  <div class="listContainer">
    <a href="customerlist.do" class="item">
        <div class="icon">▶</div>
        <div class="text">나의 정보</div>
    </a>
    <a href="tranlist.do" class="item">
        <div class="icon">▶</div>
        <div class="text">번역 목록</div>
    </a>
    <a href="myBoard.do" class="item">
        <div class="icon">▶</div>
        <div class="text">내가 작성한 글 보기</div>
    </a>
  </div>

  <div class="infoContainer">
    <a href="#" class="item">
      <div>icon</div>
      <div>공지사항</div>
    </a>    
    <a href="gradeinfo.do" class="item">
      <div>icos</div>
      <div>등급안내</div>
    </a>    
    <a href="#" class="item">
      <div>icon</div>
      <div>고객센터</div>
    </a>
  </div>
</div>

</body>
</html>
<%@include file="include/footer.jsp"%>