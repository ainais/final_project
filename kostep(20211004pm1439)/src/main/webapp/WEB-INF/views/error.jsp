<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 관리자 페이지 시작 -->
<c:if test='${sessionScope.loginSession.userGrade == "관리자" }'>
	관리자 모드 실행적용 중
</c:if>
<!-- 관리자 페이지 종료 -->
<h1>에러입니당 &lt; o &gt;</h1>
</body>
</html>