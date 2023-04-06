<%@include file="include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
  $(function(){
	  $("#chatButton").click(function(){
		  var chatText = $("#chatText").val();
		  var chatSecret = $("#chatSecret").val();
		  if(chatText == null || chatText == ""){
			  alert("채팅을 입력해야 전송 가능합니다");
			  return;
		  }
		  
	      $.ajax({
	          url:"ajaxText.do",
	          type:"post",
	          contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	          data:{
	        	  textContent:chatText,
	        	  customerSecret:chatSecret
	        	  },
	          success:function(message){
	             $("#chatList").append("<div style='color:red'>"+message+"</div>");
	             var chatText = $("#chatText").val("");
	          }
	       }) // end of ajax

	  }) // end of chatButton

	 
	 $("#chatList").css({"border":"1px black solid", "width":"70%","backgroundColor":"#B2C7D9","marginLeft":"50px",
		 "color":"black","fontSize":"16px","fontWeight":"bold"	 
	 }) // end of chatList css
	 
	 $("#chatList div").css({"width":"50%","backgroundColor":"#FFEB33","padding":"5px","margin":"5px","borderRadius":"25px"})
 	 $("#openChatTitle1").css({"color":"red","fontSize":"30px","fontWeight":"bold"})
 	 $("#openChatTitle2").css({"color":"blue","fontSize":"30px","fontWeight":"bold"})
		 
  }) // end of function
  </script>
  </head>
  <body>
  <hr>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="openChatTitle1">오픈</span><span id="openChatTitle2">채팅</span>
  <hr>
  <!-- =========================================== -->
  <!-- 오픈 챗 리스트 보기 시작 -->
  <div id ="chatList">
  <c:forEach items="${openChatList }" var="chatList">
  <div>
  	${chatList.textDate }&nbsp;${chatList.customerID }&gt;&gt;${chatList.textContent }
  </div>
  </c:forEach>
  </div>
  <!-- 오픈 챗 리스트 보기 시작 -->
  <!-- =========================================== -->
  <hr>
	  <form id="chatForm">
		  <table>
		  <tr>
			  <td><input type="hidden"></td>
			  <td>아이디 공개여부 : </td>
			  <td><input type="radio" name="chatSecret" id="chatSecret" value="공개" checked>공개
			  	  <input type="radio" name="chatSecret" id="chatSecret" value="비공개" >비공개</td>
		  </tr>
		  <tr>
		  	  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			  <td><input type="text" id="chatText" placeholder="채팅을 입력해 주세요." style="width:500px"></td>
			  <td><input type="button" id="chatButton" value="전송"></td>
		  </tr>
		  </table>
	  </form>
  </body>
</html>
<%@include file="include/footer.jsp"%>