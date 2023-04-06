<%@include file="include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <section class="hero-wrap hero-wrap-2 d-flex" style="background-image: url(resources/images/faq.jpg);">
    	
    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row d-flex align-items-center">
    			<div class="col-md-7 col-sm-12 ftco-animate text-bread d-flex align-items-center">
    				<div class="text">
	          	<h1 class="mb-3 mt-5 bread">FAQ</h1>
	            <p2 class="breadcrumbs"><span class="mr-2"><a href="faq">Home</a></span> <span>Contact</span></p2>
	            <a href="contact" class="nav-link">Contact</a>
	            <a href="faq" class="nav-link">FAQ</a>
            </div>
          </div>
    		</div>
    	</div>
    </section><br><hr>
 <!-- 아코디언 메뉴 추가 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

   <style>
   
   *{
     box-sizing: border-box; 
   }
     
   .que:first-child{
       border-top: 1px solid black;
     }
     
   .que{
     position: relative;
     padding: 17px 0;
     cursor: pointer;
     font-size: 14px;
     border-bottom: 1px solid #dddddd;
     
   }
     
   .que::before{
     display: inline-block;
     content: 'Q';
     font-size: 14px;
     color: #006633;
     margin-right: 5px;
   }
   
   .que.on>span{
     font-weight: bold;
     color: #006633; 
   }
     
   .anw {
     display: none;
       overflow: hidden;
     font-size: 14px;
     background-color: #f4f4f2;
     padding: 27px 0;
   }
     
   .anw::before {
     display: inline-block;
     content: 'A';
     font-size: 14px;
     font-weight: bold;
     color: #666;
     margin-right: 5px;
   }
      
   
   </style>

   <script type="text/javascript">
   
   $(function(){
   
   $(".que").click(function() {
     $(this).next(".anw").stop().slideToggle(300);
     $(this).toggleClass('on').siblings().removeClass('on');
     $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
   });
   $("#Accordion_wrap").css({"width":"70%","marginLeft":"200px"})
   $("#koSpan").css({"color":"red"})
   $("#pagoSpan").css({"color":"blue"})
   $("#pagoSpan").css({"color":"blue"})
   }) // end of $(function()
         
   </script>



<!-- ====== 아코디언 추가 ====== -->

<h1><span id="koSpan">&nbsp;&nbsp;&nbsp;&nbsp;Ko</span><span id="pagoSpan">pago</span> 회원님들의 자주묻는 질문의공간</h1>

<div id="Accordion_wrap">
     <div class="que">
      <span>영어만 번역이 가능한가요?</span>
     </div>
     <div class="anw">
      <span>현재는 영어만 번역이 가능합니다.추후에 다른 언어들도 기능 추가 됩니다.</span>
     </div>
      <div class="que">
      <span> 별점은 어떤 방식으로 얻게되나요?</span>
     </div>
     <div class="anw">
      <span>별점은 커뮤니티 게시판에 올라 온 질문에 대한 답변을 할 시 답변채택이 되면 별점을 받는 방식으로 되어 있습니다.</span>
     </div>
      <div class="que">
      <span>번역 정확도는 어느 정도 되나요?</span>
     </div>
     <div class="anw">
      <span>현재 정확도는 60% 정도 이지만 점점 증가하고 있습니다.</span>
     </div>
      <div class="que">
      <span>회원 정보 수정은 어떻게 하나요?</span>
     </div>
     <div class="anw">
      <span>마이페이지에서 회원 정보 수정이 가능합니다.</span>
     </div>     
      <div class="que">
      <span>문의사항은 어디에 적나요?</span>
     </div>
     <div class="anw">
      <span>contact 페이지에서 메세지를 보낼 수 있습니다.</span>
     </div>     
      <div class="que">
      <span>아이디를 변경하고 싶어요</span>
     </div>
     <div class="anw">
      <span>아이디는 아쉽게 변경이불가능하다는점 알려드립니다.</span>
     </div>        
      <div class="que">
      <span>본인인증은 필요 시점에 매번 하나요?</span>
     </div>
     <div class="anw">
      <span>일부 본인인증이 필요한경우가 있습니다.</span>
     </div>                  
</div>

<!-- ====== 아코디언 추가 ====== -->
<br><hr>




<%@include file="include/footer.jsp"%>