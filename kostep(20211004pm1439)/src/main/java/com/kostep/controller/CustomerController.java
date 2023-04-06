package com.kostep.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	@RequestMapping("{url}")
	public String viewPage(@PathVariable String url) {
		System.out.println(url+"요청 실행");
		return url;
	}
	
	@RequestMapping("{url}.do")
	public String viewPageD0(@PathVariable String url) {
		System.out.println(url+".do 요청 실행");
		return url;
	}
	
	// 1) 로그인
	@RequestMapping("login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("loginConfirm")
	public String loginConfirm(CustomerVO customerVO, HttpSession session, Model m) {
		String returnPage;
		returnPage="login";
		System.out.println("======================");
		System.out.println("로그인 시 부여받은 값 확인");
		System.out.println(customerVO.getCustomerID());
		System.out.println(customerVO.getPasswd());
		
		// DB로부터 해당 값 불러오기
		if(customerService.selectLoginVO(customerVO) != null) {
			CustomerVO DbCustomerVO = customerService.selectLoginVO(customerVO);
			System.out.println("======================");
			System.out.println("DB로부터 얻은 값 확인");
			System.out.println(DbCustomerVO.getCustomerID());
			System.out.println(DbCustomerVO.getPasswd());
			
			
			session.setAttribute("loginSession", DbCustomerVO);
			returnPage = "../../index";
		}
		else if(customerService.selectLoginVO(customerVO) == null){
			m.addAttribute("failLogin","존재하지 않는 아이디 이거나 비밀번호가 틀렸습니다.");
		}

		return returnPage;
	}
	
	// 2) 로그아웃   
	
	@RequestMapping("logout")
	public String Logout(CustomerVO customerVO, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "../../index";
	
	}
	
	// 3) 회원가입 

	 @RequestMapping("signupForm") 
	 public String signupForm(CustomerVO customerVO) {
		 
		 customerService.signup(customerVO);
		 
		 
		 // 회원가입 성공 시 로그인 페이지로 이동
		 return "login";
	 }

	 // 4 ) id 중복체크

	 @ResponseBody
	 @RequestMapping(value="idCheck", produces="application/text;charset=UTF-8")
	 public String idCheck(CustomerVO customerVO) throws Exception {
		 System.out.println("idcheck컨트롤러 성공");
		 int result = customerService.idCheck(customerVO);
		 String message;
		 if(result == 1) {
			 message = "1";
		 }
		 else {
			 message = "0";
		 }
		 
		 return message;
		 
	 }

	 // ==========================================
	 // 마이페이지 시작
		//회원 목록 보기
		@RequestMapping("customerlist")
		public String customerlist(CustomerVO customerVO,Model model){
		model.addAttribute("customerList",customerService.customerlist(customerVO));
		return "customerlist";
		}
		
		// 마이페이지 회원정보 수정 ajax
		@ResponseBody
		@RequestMapping(value="ajaxMypageModify",produces="application/text;charset=UTF-8")
		public String ajaxMypageModify(CustomerVO customerVO,HttpSession session) throws Exception {
			String message;
			System.out.println(customerVO.getPhone());
			CustomerVO sessionCustomerVO = (CustomerVO) session.getAttribute("loginSession");
			
			customerVO.setCustomerID(sessionCustomerVO.getCustomerID());
			System.out.println(sessionCustomerVO.getCustomerID());
			customerService.ajaxMypageModify(customerVO);

			session.removeAttribute("loginSession");
			// session expire
			
			message = "정상적으로 업데이트에 성공했습니다.";
				
			return message ;
			 
		 }
		
		// 마이페이지 회원정보 삭제 ajax
		@ResponseBody
		@RequestMapping(value="ajaxMypagedelete",produces="application/text;charset=UTF-8")
		public String ajaxMypagedelete(CustomerVO customerVO,HttpSession session) throws Exception {
			String message;
			System.out.println(customerVO.getPasswd());
			CustomerVO sessionCustomerVO = (CustomerVO) session.getAttribute("loginSession");
			customerVO.setPasswd(sessionCustomerVO.getPasswd());
			System.out.println(sessionCustomerVO.getPasswd());
			customerService.ajaxMypagedelete(customerVO);
			message = "회원 탈퇴가 완료되었습니다. 재로그인이 필요합니다";
			
			session.removeAttribute("loginSession");
			
		

			return message ;
		} // end of 마이페이지 회원정보 삭제
	 // 마이페이지 종료
	 // ==========================================
		
		// 네이버 로그인 페이지
		@RequestMapping(value="callBack.do")
		public String callBack() {
			// 네이버로부터 데이터들을 받기
			
			// customerVO객체를 선언하고 네이버로부터 받은 데이터들을 customerVO에 저장하기
			
			// 만약 db값에 이 네이버 값이 없으면 insert into로 회원가입처럼 만들기
			
			// 세션에 customerVO 부여하면서 login처럼 만들기
			return "callBack";
		}
		
		// 마이페이지 회원정보 삭제 ajax
		@ResponseBody
		@RequestMapping(value="ajaxNaverLogin",produces="application/text;charset=UTF-8")
		public String ajaxNaverLogin(CustomerVO customerVO,HttpSession session) throws Exception {
			String message;
			message = "네이버 로그인 성공";
			return message ;
		
		
		} // end of 마이페이지 회원정보 삭제
		//------------ 회원가입 이메일연동 시작----------------------
				@ResponseBody
				@RequestMapping(value="sendemail", produces="application/text;charset=UTF-8")
					public String mailCheck(CustomerVO vo) throws Exception {
						
						String host = "smtp.naver.com";
						String user = "kth930714@naver.com";
						String password = "Dhkdthfk12!@";

						Properties props = new Properties();
						props.put("mail.smtp.auth", true);
						props.put("mail.smtp.host", host);
						props.put("mail.smtp.port", 465);
						props.put("mail.smtp.ssl.enable", "true"); 
						props.put("mail.smtp.ssl.trust", "smtp.naver.com");
						props.put("mail.smtp.ssl.protocols", "TLSv1.2");
						
		                //인증 번호 생성기
		                StringBuffer temp =new StringBuffer();
		                Random rnd = new Random();
		                for(int i=0;i<10;i++)
		                {
		                    int rIndex = rnd.nextInt(3);
		                    switch (rIndex) {
		                    case 0:
		                        // a-z
		                        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		                        break;
		                    case 1:
		                        // A-Z
		                        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		                        break;
		                    case 2:
		                        // 0-9
		                        temp.append((rnd.nextInt(10)));
		                        break;
		                    }
		                }
		                String AuthenticationKey = temp.toString();
		                System.out.println(AuthenticationKey);

						Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
								return new PasswordAuthentication(user, password);
							}
						});

						session.setDebug(true); //Debug 모드 설정.

							MimeMessage message = new MimeMessage(session);
							message.setFrom(new InternetAddress(user));
							message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail()));
							message.setSubject("이메일인증번호입니다.");
							message.setText("인증번호는 " + AuthenticationKey +" 입니다.");
							Transport.send(message);
										
						return AuthenticationKey;
							
					}
			//------------ 회원가입 이메일연동 종료----------------------
				//--------------Contact us 이메일 시작-----------------------
				@ResponseBody
				@RequestMapping(value="contactus", produces="application/text;charset=UTF-8")
				public void contactemail(String name, String subject, String email,String message) throws Exception{
					
//					System.out.println(subject);
//					System.out.println(email);
//					System.out.println(message);
					String host = "smtp.naver.com";
					String user = "kth930714@naver.com";
					String password = "Dhkdthfk12!@";

					Properties props = new Properties();
					props.put("mail.smtp.auth", true);
					props.put("mail.smtp.host", host);
					props.put("mail.smtp.port", 465);
					props.put("mail.smtp.ssl.enable", "true"); 
					props.put("mail.smtp.ssl.trust", "smtp.naver.com");
					props.put("mail.smtp.ssl.protocols", "TLSv1.2");
					

					Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(user, password);
						}
					});

					session.setDebug(true); //Debug 모드 설정.

						MimeMessage text = new MimeMessage(session);
						text.setFrom(new InternetAddress(user));
						text.addRecipient(Message.RecipientType.TO, new InternetAddress("kou8148@naver.com"));
						text.setSubject(name + "님의 문의내역입니다.");
						text.setText(name+"님으로부터의 문의 : "+email+"\n"+"제목 : "+subject+"\n"+"내용 : "+message);
						Transport.send(text);
					
				}
			//------------Contact US 이메일전송완료---------------------------------------	
			//==========================================
			// my board 시작
			@RequestMapping(value="myBoard.do")
			public String myBoard(HttpSession session, Model m) {
				if(session.getAttribute("loginSession") != null) {
					CustomerVO customerVO = (CustomerVO) session.getAttribute("loginSession");
					m.addAttribute("AllMyBoard",customerService.selectMyboard(customerVO));
				} // end of session
				return "myBoard";
			}
			
			@RequestMapping(value="myLikeBoardList.do")
			public String myLikeBoardList(HttpSession session, Model m) {
				if(session.getAttribute("loginSession") != null) {
					CustomerVO customerVO = (CustomerVO) session.getAttribute("loginSession");
					

						String[] boardLikeList = customerVO.getBoardLike().split(",");
						ArrayList<BoardVO> AllMyBoardLike = new ArrayList<>();
						
						for(String str : boardLikeList) {
							AllMyBoardLike.addAll(customerService.selectLikeBoard(str));
						}
						
						for(BoardVO vo : AllMyBoardLike) {
							
							System.out.println(vo.getBoardID());
						}
						m.addAttribute("AllMyBoard",AllMyBoardLike);

				} // end of session
				
				return "myBoard";
			}
			
			@RequestMapping(value="myFreeboardList.do")
			public String myFreeboardList(HttpSession session, Model m) {
				if(session.getAttribute("loginSession") != null) {
					CustomerVO customerVO = (CustomerVO) session.getAttribute("loginSession");

					m.addAttribute("AllMyBoard",customerService.myFreeboardList(customerVO));
				} // end of session
				
				return "myBoard";
			}
			
			@RequestMapping(value="myBoardOepnChat.do")
			public String myBoardOpenChat(HttpSession session, Model m) {
				if(session.getAttribute("loginSession") != null) {
					CustomerVO customerVO = (CustomerVO) session.getAttribute("loginSession");
					m.addAttribute("AllMyBoard",customerService.openChatList(customerVO));
				} // end of session
				
				return "myBoardOepnChat";
			}
			
			// my board 종료
			//==========================================	
} // end of class
	 

