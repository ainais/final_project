<%@include file="include/header.jsp"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

//==============================================================
// 0920 현길 start
//삭제시 비밀번호 추가 
// ==============================================================
 $(function(){
	 var cnt = 0;
	 $('#delete').click(function(){
				cnt++;
				if(cnt == 1){
				// 동적으로 버튼이랑 이런것들을 만든 것
				$('#deleteDiv').append("<br><br><hr><div>"+"삭제를 하기 위해서는 비밀번호 확인이 필요합니다."+"</div>")
				// 크기 좀 조정하기
				$('#deleteDiv').append("<br><div><input type='text' id='ajaxConfirmDelete' placeholder='비밀번호 확인이 필요합니다.'></div>")
				$("#ajaxConfirmDelete").css({"width":"400px"})
				$('#deleteDiv').append("<br><div><input type='button' id='ajaxConfirmDeleteButton' value='게시글 삭제 신청하기'></div>")		
				}
				else{
					alert("이미 비밀번호 확인이 진행중입니다.");
				}
	 }) // end of #delete click
	 
	 $(document).on("click","#ajaxConfirmDeleteButton",function(){
	      $.ajax({
	          url:"ajaxFreeboardDelete.do",
	          type:"post",
	          contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	          data:{
	        	  boardID:"${board.boardID}",
				  inputPasswd:$("#ajaxConfirmDelete").val()
	        	  },
	          success:function(message){
	             alert(message);
	             location.href="freeboard.do";
	          }
	       }) // end of ajax

	 }) // end of #ajaxConfirmDeleteButton click
	 

 	$("#registerReply").click(function(){
 		var replyContent = $("#replyContent").val();
 		var replyWriter = $("#replyWriter").text();
 		
 		if(replyWriter == ""){
 			alert("로그인 후 답글 작성이 가능합니다.");
 			location.href="login.do";
 			return
 		}
 		
 		if(replyContent == "" || replyContent == null){
 			alert("공백은 답글 할 수 없습니다.");
 			return
 		}
	      $.ajax({
	          url:"ajaxReply.do",
	          type:"post",
	          contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	          data:{
	        	  boardID:"${board.boardID}",
	        	  boardContent:replyContent,
	        	  replyWriter:replyWriter
	        	  },
	          success:function(message){
	             alert(message);
	             if(message == "로그인 후 답글 작성이 가능합니다."){
	            	location.href="login.do"; 
	             }
	             else{
	            	 $("#commentList").append("<div>작성자:"+replyWriter+"<br>답글내용:"+replyContent+"</div><br>");
	            	 $("#replyContent").val("");
	             }
	             
	          }
	       }) // end of ajax
 	}) // end of 답글 등록

 	$("#replyDiv svg").click(function(){
 		
	      $.ajax({
	          url:"selectReply.do",
	          type:"post",
	          contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	          data:{
	        	  board_writer:$("#board_writer").val(),
	        	  boardID:$("#board_ID").val(),
				  replyID:$("#replyID").val(),
				  customerID:$("#replyWriter").text()
	        	  },
	          success:function(message){
	             alert(message);
	             if(message == "세션이 만료되어 로그인이 필요합니다."){
	            	 location.href="login.do";
	             }
	          }
	       }) // end of ajax
 	}) // 채택하기 종료
 	
 	$("#replyDiv #replyModify").click(function(){
 		if($(this).text() == "답글 수정"){
 	 		var replyID = $(this).parents("#replyDiv").find("#replyID").val()
 	 		var replySelect = $(this).parents("#replyDiv").find("#selectSpan").text()
 	 		
 	 		if(replySelect == "채택된 답글입니다!"){
 	 			alert("채택된 답글은 변경할 수 없습니다.");
 	 			return;
 	 		} // 채택된 답글 변경 불가하도록 무결성 추가
 	 		
 	 		var replyContent = $(this).parents("#replyDiv").find("#replyContent").text();
 	 		$(this).parents("#replyDiv").find("#replyContent").text("");
 	 		$(this).parents("#replyDiv").find("#replyContent").append("<input type='text' id='modifyReplyContent' value='"+replyContent+"'>")
 	 		
 	 		$(this).text("답글 수정 진행 중")
 		} // end of 답글 수정
 		else if($(this).text() == "답글 수정 진행 중"){
 			var modifyReplyContent = $("#modifyReplyContent").val();

 			$(this).parents("#replyDiv").find("#replyContent").text(modifyReplyContent);
 			// ajax 추가
 
 			 $.ajax({
	         url:"ajaxReplyModify.do",
	         type:"post",
	         contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	         data:{
	        	 replyID:$(this).parents("#replyDiv").find("#replyID").val(),
	        	 replyContent:modifyReplyContent
	        	 },
	         success:function(message){
	            alert(message);
	            
	         }
	      }) // end of ajax
 			$(this).parents("#replyDiv").find("#replyContent #modifyReplyContent").remove();

 			$(this).text("답글 수정")
 		} // end of 답글 수정 진행

 		
 	}) // end of 답글 수정 클릭
 	
 	$("#replyDiv #replyDelete").click(function(){
 		var replyID = $(this).parents("#replyDiv").find("#replyID").val()
 		alert(replyID);
 	}) // end of 답글 삭제
	// ==============================================================================
	// CSS 구간 시작
	$("#registerText").css({"color":"blue","fontWeight":"bold","fontSize":"30px"})
	$("#modifyFreeboard").css({"color":"black","fontWeight":"bold","fontSize":"30px"})
	$("#deleteFreeboard").css({"color":"black","fontWeight":"bold","fontSize":"30px"})
	$("#selectSpan").css({"color":"red","fontWeight":"bold","fontSize":"30px"})
	// CSS 구간 종료
	// ==============================================================================
 }) // end of function
		</script>
	 
 
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
							href="openChat" class="nav-link">오픈채팅방</a> <a
							href="boardInfo" class="nav-link">게시판안내</a>
					</div>
				</div>
			</div>
		</div>
	</section>

<div class="row" style="margin-bottom:20px; margin-left:1px;">
<div class="col-lg-12">
<h1 class="page-header">Free Board Viewing Section</h1>
</div>
</div>

<div class="panel" style="text-align: center;">
<div id="contAreaBox">
<div class="panel">
<div class="panel-body">
<form role="form" action="updateBoard" method="post">
				<input type="hidden" id="board_ID"
					name="boardID" class="form-control" style="width: 840px" value="${board.boardID}"/>
<div class="table-responsive" style="text-align:center;">
	<table id="datatable-scroller"
		class="table table-bordered tbl_Form">
		<caption></caption>
		<colgroup>
			<col width="250px" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th class="active" >Writer</th>
				<td class="form-inline"><input type="text" id="board_writer"
					name="customerID" value="${board.customerID}" class="form-control" style="width: 200px" readonly/>


				</td>
			</tr>
			<tr>
				<th class="active">Title</th>
				<td class="form-inline"><input type="text" id="board_title"
					name="boardTitle" value="${board.boardTitle}" class="form-control" style="width: 840px" />
				</td>
			</tr>
			<tr>
				<th class="active" >Content</th>
				<td class="form-inline"><textarea 
						id="boardContent" name="boardContent" cols="100" rows="10"
						class="form-control" >${board.boardContent}</textarea></td>
			</tr>
		</tbody>
	</table>
</div>
<!-- 0920 현길 start -->
	<!-- 로그인된 아이디와 작성아이디가 같은때 수정 ,삭제 보이기 -->							
<div style="text-align: center;">

<c:if test="${sessionScope.loginSession.customerID == board.customerID or sessionScope.loginSession.customerClassification == '관리자'}">
<div class="btn_wrap" id="deleteDiv">
<button type="submit" onclick="updateBoard?boardID=${board.boardID }" class="btn btn-primary" id="insert"><span id="modifyFreeboard">수정</span></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<button type="button" class="btn btn-danger" id="delete"><span id="deleteFreeboard">삭제</span></button>
	</div>
</c:if>
<!-- 0920 현길 finish -->
</div>
</form>
</div>
</div>
</div>
</div>
<!-- 0920 현길 start -->
<!-- ================================================================ -->
<!-- 답변 부분 시작 -->
<hr>
<div class="row" style="margin-bottom:30px; margin-left:2px;">
<div class="panel" style="text-align: left;">
<div class="container">
        <div id="commentList">
        <c:forEach items="${replyList }" var="reply">
        	<input type="hidden">
        	<div id="replyDiv">
        		<input type="hidden" id="replyID" value="${reply.replyID}">
	        	작성자:<span id="replyWriter">${reply.customerID }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	<c:if test="${reply.boardSelect == '채택'}">
		        	<span id="selectSpan">채택된 답글입니다!</span>
		        	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
					  <path d="M13.485 1.431a1.473 1.473 0 0 1 2.104 2.062l-7.84 9.801a1.473 1.473 0 0 1-2.12.04L.431 8.138a1.473 1.473 0 0 1 2.084-2.083l4.111 4.112 6.82-8.69a.486.486 0 0 1 .04-.045z"/>
					</svg>
	        	</c:if>
	        	<c:if test="${reply.boardSelect != '채택'}">
		        	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
					  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
					</svg>
	        	</c:if>
	        	<br>
	        	답글내용:<span id="replyContent">${reply.replyContent }</span>
	        	<br><br>
	        	<c:if test="${sessionScope.loginSession.customerID == reply.customerID }">
		        	<button type="button" class="btn btn-primary text-dark" id="replyModify">답글 수정</button>
		        	<button type="button" class="btn btn-danger text-dark" id="replyDelete">답글 삭제</button>
	        	</c:if>
        	</div>
        	<br>
        </c:forEach>
        <br><br>
        </div>
</div>
<div class="container">
<hr>
    <form id="replyForm" name="replyForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Reply : 작성자 = </strong></span> <span id="replyWriter">${sessionScope.loginSession.customerID }</span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                         
                            <textarea style="width: 1100px" rows="6" cols="30" id="replyContent" name="replyContent" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a class="btn pull-right btn-success" id="registerReply"><span id="registerText">등록</span></a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
               
    </form>
</div>

</div>
</div>
<!-- 답변 부분 종료 -->
<!-- ================================================================ -->


	
	
				
 

<%@include file="include/footer.jsp"%> 