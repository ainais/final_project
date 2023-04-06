/**
 * 
 */
$(document).ready(function(){
	//회원가입 버튼(회원가입시 빈칸없도록)
	$("#signup").click(function(){
		if($.trim($('#customerID').val())==''){
			alert("아이디를 입력하세요");
			$('#costomerID').focus();
			return;
		}else if($.trim($('#password').val())==''){
			alert("비밀번호 입력하세요");
			$('#password').focus();			
		}else if($.trim($('#gender').val())==''){
			alert("성별을 선택하세요");
			$('#gender').focus();	
			return;
		}else if($.trim($('#name').val())==''){
			alert("이름을 입력하세요");
			$('#gender').focus();	
			return;
		}else if($.trim($('#birthday').val())==''){
			alert("생년월일을 입력하세요");
			$('#birthday').focus();		
			return;
		}else if($.trim($('#phone').val())==''){
			alert("전화번호를 입력하세요");
			$('#phone').focus();
			return;
		}else if($.trim($('#address').val())==''){
			alert("주소를 입력하세요");
			$('#address').focus();
			return;
		}else if($.trim($('#job').val())==''){
			alert("직업을 선택하세요");
			$('#job').focus();	
			return;
		}else if($.trim($('#email').val())==''){
			alert("이메일을 입력하세요");
			$('#email').focus();
		}else{
		$("#signupForm").attr("action", "signupForm");
		$("#signupForm").submit();
		}
	});
	
})

 $(function() {
	    //idck 버튼을 클릭했을 때 
	    $("#idCheck").click(function() {

	        var customersID =  $("#customerID").val(); 
	        if(customersID == ""){
	        	alert("양식에 맞게 아이디를 입력하세요")
	        }
	        else{
	        $.ajax({
	            async: true,
	            type : 'POST',
	            data : {customerID : customersID},
	            url : "idCheck",
	            dataType : "text",	           
	            success : function(data) {
	                if (data == "1" ) {
	                    
	                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
	                    $("#customerID").focus();
	                                 
	                } 
	                else {
	                    alert("사용가능한 아이디입니다.");
	                    $("#passwd").focus();
	                    //아이디가 중복하지 않으면  idck = 1 
	                    
	                }
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	            }
	        });
	        
	        
	    }
	    });
	});

