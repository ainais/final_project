<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#insert").click(function(){
		if($('#board_writer').val() == ''){
			alert("로그인 후 사용이 가능합니다.");
			$('#board_writer').focus();
			return;
		}

		if($.trim($('#board_title').val())==''){
			alert("제목을 입력하세요");
			$('#board_title').focus();
			return;
		}
		
		if($.trim($('#boardContent').val())==''){
			alert("내용을 입력하세요");
			$('#boardContent').focus();
			return;
		}

		if($("#posting_star").val() > parseInt($("#havingStar").text())){
			alert("첨부 Star는 보유 Star를 넘을 수 없습니다.");
			return;
		}
		if($("#language").val() == "0"){
			alert("언어를 선택해야 합니다.")
			return;
		}
		alert("성공적으로 글 작성을 완료했습니다.");
		$("#insertForm").submit();
	}) // end of click
	
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
						<h1 class="mb-3 mt-5 bread">Community</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="community">Home</a></span> <span>Community</span>
						</p>
						<a href="freeboard" class="nav-link">Free Board</a> <a
							href="openChat" class="nav-link">Open Chat</a> <a
							href="boardInfo" class="nav-link">Board Info</a>
					</div>
				</div>
			</div>
		</div>
	</section>

<div class="row" style="margin-bottom:20px; margin-left:1px;">
<div class="col-lg-12">
<h1 class="page-header">자유 번역 게시판</h1>
</div>
</div>

<div class="panel" style="text-align: center;">
<div id="contAreaBox">
<div class="panel">
<div class="panel-body">
<!-- ----------------------------------------------- -->
<!-- insertForm 시작 -->
<form role="form" action="insert.do" method="post" id=insertForm>
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
				<th class="active" ><input type="hidden"></th>

				<td class="form-inline"><input type="hidden" />
					
				</td>

			</tr>
			<tr>
				<th class="active" >작성자</th>
				<c:if test="${sessionScope.loginSession != null }">
				<td class="form-inline"><input type="text" id="board_writer"
					name="customerID" class="form-control" style="width: 200px" value="${sessionScope.loginSession.customerID}"/>
				</td>
				</c:if>
				<c:if test="${sessionScope.loginSession == null }">
				<td class="form-inline"><input type="text" id="board_writer"
					name="customerID" class="form-control" style="width: 800px" value="로그인 후 사용 가능합니다." readonly/>
					
				</td>
				</c:if>
			</tr>
			<tr>
				<th class="active" >첨부 Star</th>
				<c:if test="${sessionScope.loginSession != null }">
				<td class="form-inline">
				<input type="text" id="posting_star"
				name="postingStar" class="form-control" style="width: 240px" value="${sessionScope.loginSession.star}">&nbsp;&nbsp;&nbsp;&nbsp; 보유중인 Star : &nbsp;&nbsp;<span id="havingStar">${sessionScope.loginSession.star}</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Star를 만드는 방법? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-patch-question-fill" viewBox="0 0 16 16">
				  <path d="M5.933.87a2.89 2.89 0 0 1 4.134 0l.622.638.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636zM7.002 11a1 1 0 1 0 2 0 1 1 0 0 0-2 0zm1.602-2.027c.04-.534.198-.815.846-1.26.674-.475 1.05-1.09 1.05-1.986 0-1.325-.92-2.227-2.262-2.227-1.02 0-1.792.492-2.1 1.29A1.71 1.71 0 0 0 6 5.48c0 .393.203.64.545.64.272 0 .455-.147.564-.51.158-.592.525-.915 1.074-.915.61 0 1.03.446 1.03 1.084 0 .563-.208.885-.822 1.325-.619.433-.926.914-.926 1.64v.111c0 .428.208.745.585.745.336 0 .504-.24.554-.627z"/>
				</svg>
				</td>
				</c:if>
				
				<c:if test="${sessionScope.loginSession == null }">
				<td class="form-inline">
				<input type="text" id="posting_star"
				name="postingStar" class="form-control" style="width: 800px" value="로그인 후 사용 가능합니다." readonly/>
				</td>
				</c:if>
			</tr>
			<tr>
				<th class="active">제목</th>
				<c:if test="${sessionScope.loginSession != null }">
				<td class="form-inline"><input type="text" id="board_title"
					name="boardTitle" class="form-control" style="width: 840px" />&nbsp;&nbsp;&nbsp;
					
				<select name="language" id="language" class="btn btn-lg py-2 btn-primary text-dark">
    				<option value="0" selected="selected">언어 선택</option>
    				<option value="EK">영 => 한</option>
				</select>	
				</td>
				</c:if>
				<c:if test="${sessionScope.loginSession == null }">
				<td class="form-inline"><input type="text" id="board_title"
					name="boardTitle" class="form-control" style="width: 840px" value="로그인 후 사용 가능합니다." readonly/>
				</td>
				</c:if>
			</tr>
			<tr>
				<th class="active" >내용</th>
				
				<td class="form-inline"><textarea 
						id="boardContent" name="boardContent" cols="100" rows="10"
						class="form-control"></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
	<div style="text-align: center;">
		<button type="button" class="btn btn-primary" id="insert">Okay</button>
		<a href="freeboard" class="btn btn-danger">Cancel</a>
		<hr>
		<a href="login.do" class="btn btn-success">로그인하러가기</a>
	</div>
</form>
<!-- insertForm 종료 -->
<!-- ----------------------------------------------- -->
</div>
</div>
</div>
</div>



<%@include file="include/footer.jsp"%> 