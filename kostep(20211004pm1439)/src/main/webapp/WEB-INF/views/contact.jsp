<%@include file="include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 문의사항 보낼때 빈 칸 없이 보내기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#sendMessage").click(function(){
		if($('#email').val() == ''){
			alert("이메일을 입력하세요");
			$('#email').focus();
			return;
		}

		if($.trim($('#subject').val())==''){
			alert("제목을 입력하세요");
			$('#subject').focus();
			return;
		}
		
		if($.trim($('#message').val())==''){
			alert("내용을 입력하세요");
			$('#message').focus();
			return;
		}else{
		      $.ajax({
		          type : 'POST',
		          data : {
		        	  name : $("#name").val(),
		        	  email : $("#email").val(),
		        	  subject : $("#subject").val(),
		        	  message : $("#message").val()
		        	  },
		          contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		          url : "contactus.do",	           
		          success : function(data) {
						alert("메일이 보내졌습니다.")
		          },
		          error : function(error) {
		              alert("error : " + error);
		          } // end of error
		      }); // end of ajax
		}

		
	}) // end of click
}) // end of function   
</script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyB3df8GgETx88Fv2aBJxKG0R-2IXbeDnX0"></script>
<style>
#map_ma {
	width: 100%;
	height: 400px;
	clear: both;
	border: solid 1px red;
}
</style>


<section class="hero-wrap hero-wrap-2 d-flex" style="background-image: url(images/bg_2.jpg);">

    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row d-flex align-items-center">
    			<div class="col-md-7 col-sm-12 ftco-animate text-bread d-flex align-items-center">
    				<div class="text">
	          	<h1 class="mb-3 mt-5 bread">문의</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="contact">홈</a></span> <span>Contact</span></p>
	            <a href="contact" class="nav-link">문의</a>
	            <a href="faq" class="nav-link">FAQ</a>
	           
            </div>
          </div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-12 mb-4">
            <h2 class="heading">Contact Information</h2>
          </div>
          <div class="w-100"></div>
          <div class="col-md-3 d-flex">
          	<div class="con align-self-stretch p-4">
	            <p><span>Address:<br/> 서울특별시 금천구 가산동 426-5 월드 메르디앙 벤처 센터 2 차</span> </p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="con align-self-stretch p-4">
	            <p><span>Phone:<br/> 010-8667-8148</span></p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="con align-self-stretch p-4">
	            <p><span>Email: kou8148@naver.com</span></p>
	          </div>
          </div>
          
        </div>
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <form action="">
              <div class="form-group">
                <input type="hidden">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="name" placeholder="본인이름">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="email" placeholder="본인이메일">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="subject" placeholder="제목">
              </div>
              <div class="form-group">
                <textarea id="message" cols="30" rows="7" class="form-control" placeholder="문의내역"></textarea>
              </div>
              <div class="form-group">
                <button  class="btn btn-primary py-3 px-5" id="sendMessage">메일보내기</button>
              </div>
            </form>
          
          </div>
			<!-- 구글 맵 보이기 -->
           <div class="col-md-6 d-flex"> 
           
	
         <div id="map_ma"></div>
         
          	 
         
	<script type="text/javascript"> $(document).ready(function() { var myLatlng = new google.maps.LatLng(35.837143,128.558612); // 위치값 위도 경도
	var Y_point = 37.47885; // Y 좌표 
	var X_point = 126.87866; // X 좌표 
	var zoomLevel = 16; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼 
	var markerTitle = "월드메르디앙벤처센터 2차"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var markerMaxWidth = 200; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기 
	// 말풍선 내용 
	var contentString = '<div>' + '<h4>서울시 금천구</h4>'+ '<p>안녕하세요<p/>'+
	'<p>(주) NEXT LEVEL 입니다.</p>' + '</div>'; 
	var myLatlng = new google.maps.LatLng(Y_point, X_point); 
	var mapOptions = { zoom: zoomLevel, center: myLatlng, mapTypeId: google.maps.MapTypeId.ROADMAP } 
	var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions); 
	var marker = new google.maps.Marker({ position: myLatlng, map: map, title: markerTitle }); 
	var infowindow = new google.maps.InfoWindow( { 
		content: contentString, 
		maxWizzzdth: markerMaxWidth }
	); 
	google.maps.event.addListener(marker, 'click', function() { 
		infowindow.open(map, marker); 
		}); 
	}); 
</script>
</div>


          </div>
        </div>
     
    </section>
    
<%@include file="include/footer.jsp"%>