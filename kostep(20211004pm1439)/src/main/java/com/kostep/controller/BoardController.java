package com.kostep.controller;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import java.util.*;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.domain.PagingVO;
import com.kostep.domain.ReplyVO;
import com.kostep.service.BoardServiceImpl;



@Controller
public class BoardController {	
	
	@Autowired
	private BoardServiceImpl boardService;
	
	// ajax 답글 수정 등록
	@ResponseBody
	@RequestMapping(value = "ajaxReplyModify.do",produces="application/text;charset=UTF-8")
	public String ajaxReplyModify(ReplyVO replyVO)  {
		System.out.println(replyVO.getReplyID());
		System.out.println(replyVO.getReplyContent());
		
		boardService.ajaxReplyUpdate(replyVO);
		return "답글 변경이 완료되었습니다.";
	}
	
	// 게시글 등록
	@RequestMapping(value = "insert.do")
	public String insertBoard(BoardVO boardVO)  {
		if(boardVO.getBoardSecret() == null) {
			boardVO.setBoardSecret("공개");
		}
		if(boardVO.getBoardType() == null) {
			boardVO.setBoardType("자유게시판");
		}
		System.out.println(boardVO.getPostingStar());
		boardService.insertBoard(boardVO);
		boardService.minusStar(boardVO);
		
	//	System.out.println(boardVO.getBoardID());
		return "redirect:freeboard";
	}
		
	// 게시글 상세보기
	@RequestMapping(value = "boardlists")
	public void boardlists(BoardVO boardVO, Model m)  {
		//System.out.println(boardVO.getBoardID());
		boardService.updateboardCount(boardVO); // 조회수 증가
		m.addAttribute("board", boardService.boardlists(boardVO)); // Model 정보 저장
		
		m.addAttribute("replyList",boardService.readReply(boardVO));
		
			}

		// 글 삭제
		@RequestMapping(value = "deleteboard")
		public String deleteContact(BoardVO boardVO) {
			System.out.println(boardVO.getBoardID());
			boardService.deleteBoard(boardVO);
			return "redirect:freeboard";
		}
		
		// 글 수정
		@RequestMapping(value ="updateBoard")
		public String updateBoard(CustomerVO customerVO, BoardVO boardVO) {
			System.out.println(customerVO.getCustomerID());
			System.out.println(boardVO.getBoardID());
			boardService.updateBoard(boardVO);
			return "redirect:freeboard";
		}
		
		// 게시글 보기 및 페이징
		
		@RequestMapping("freeboard")
		public String boardList(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
			
			int total = boardService.countBoard(vo);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			if(vo.getRandomData() == null) {
				vo.setRandomData(" WHERE boardType = '자유게시판'");
			}
			else {
				if(vo.getRandomData().equals("")) {
					vo.setRandomData(" WHERE boardType = '자유게시판'");
				}
			}
			System.out.println("RandomData 출력"+vo.getRandomData());
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", boardService.selectBoard(vo));
			
			boardService.selectBoard(vo);
			
			return "freeboard";
		}
		
		// 게시글 검색기능
		@RequestMapping("searchFreeboard")
		public String searchFreeboard(String searchName, String searchValue, PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {

			System.out.println(searchName);
			System.out.println(searchValue);
			model.addAttribute("searchName", searchName);
			model.addAttribute("searchValue", searchValue);
			if(searchName != null && searchValue != null) {
				if(searchName.equals("customerID")) {					
					vo.setRandomData("WHERE "+searchName+" LIKE '%"+searchValue+"%'");
				}
				else if(searchName.equals("boardTitle")) {
					vo.setRandomData("WHERE "+searchName+" LIKE '%"+searchValue+"%'");
				}
			}
			System.out.println(vo.getRandomData());
			int total = boardService.countBoard(vo);
			System.out.println("총 검색 수는 "+total);
			System.out.println(vo.getRandomData());
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			if(searchName != null && searchValue != null) {
				if(searchName.equals("customerID")) {					
					vo.setRandomData("WHERE "+searchName+" LIKE '%"+searchValue+"%'");
				}
				else if(searchName.equals("boardTitle")) {
					vo.setRandomData("WHERE "+searchName+" LIKE '%"+searchValue+"%'");
				}
			}
			System.out.println(vo.getRandomData());
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", boardService.selectBoard(vo));
			
			boardService.selectBoard(vo);
			
			return "freeboard";

		}
		
		 // ajax로 게시글 삭제 확인받기
		 @ResponseBody
		 @RequestMapping(value="ajaxFreeboardDelete.do",produces="application/text;charset=UTF-8") 
		 public String ajaxFreeboardDelete(BoardVO boardVO, String inputPasswd, HttpSession session) {
			 String result = "삭제가 정상적으로 처리되지 않았습니다.";
			 // 입력한 비밀번호 출력
			 if(boardVO.getBoardID() != null || boardVO.getBoardID().equals("")) {			 
				 System.out.println("입력받은 boardID : " + boardVO.getBoardID());
				 
				 // 입력한 비밀번호 출력
				 System.out.println("입력한 비밀번호 값 : " + inputPasswd);
				 
				 // 세션에 저장되어 있는 로그인 정보 가져오기
				 CustomerVO customerVO = (CustomerVO) session.getAttribute("loginSession");
				 System.out.println("세션에 저장되어 있는 비밀번호 값 : " +customerVO.getPasswd());
				 
				 // 입력한 비밀번호와 세션에 저장된 비밀번호 값 비교
				 System.out.println(inputPasswd.equals(customerVO.getPasswd()));

				 if(inputPasswd.equals(customerVO.getPasswd())) {
					 if(boardVO.getBoardID() != null) {
						 boardService.deleteBoard(boardVO);
						 result = boardVO.getBoardID() + "의 게시판 글이 정상적으로 삭제되었습니다.";
					 }
				 } // end of 비밀번호 비교
				 else if(!inputPasswd.equals(customerVO.getPasswd())) {
					 result = "비밀번호가 틀렸습니다.";
				 }
			 }
			 else {
				 result = "세션이 만료되었습니다. 재로그인이 필요합니다.";
			 }
		 
			 return result;
		 } // end of ajax 삭제 확인
		 
		// ajax로 게시글 답글 작성하기
		 @ResponseBody
		 @RequestMapping(value="ajaxReply.do",produces="application/text;charset=UTF-8")
		 public String ajaxReply(String replyWriter,BoardVO boardVO) {
			 String result = "";

			 if(replyWriter != null) {
				 boardVO.setFname(replyWriter); // customerID
				 
				 boardService.replyInsert(boardVO);
				 result = "답글 등록이 완료되었습니다.";
			 }
			 else {
				 result="로그인 후 답글 작성이 가능합니다.";
			 }
			 
			 return result;
		 } // end of ajax 답글 작성하기
		 
		// ajax로 채택 설정하기
		 @ResponseBody
		 @RequestMapping(value="selectReply.do",produces="application/text;charset=UTF-8")
		 public String selectReply(String board_writer,BoardVO boardVO,ReplyVO replyVO, HttpSession session) {
			 String result = "";
			 if(session.getAttribute("loginSession") != null) {
				 
				 CustomerVO sessionCustomerVO = (CustomerVO) session.getAttribute("loginSession");
				 System.out.println("게시판 작성자는 "+board_writer);
				 System.out.println("현재 로그인 한 회원의 이름은 "+sessionCustomerVO.getCustomerID());
				 
				 if(board_writer.equals(sessionCustomerVO.getCustomerID())) {
					 // 채택된 글일 경우 더이상 채택 진행 못하도록 만들기
					 BoardVO selectCheck = (BoardVO) boardService.selectCheck(boardVO);

						 if(selectCheck.getBoardSelect() == null) { // 채택 되지 않는 default값은 null이므로 null과 비교해야한다.
							 BoardVO boardData = (BoardVO) boardService.starSelect(boardVO);
							 System.out.println("게재된 스타의 량은 "+boardData.getPostingStar());
							 
							 
							 ReplyVO replyData = (ReplyVO) boardService.addStar(replyVO);
							 System.out.println(replyData.getBoardSelect());
							 
							 // 문자메시지로 송부 과정 추가 예정
							 result=replyVO.getCustomerID()+"님의 답글이 채택되어 "+boardData.getPostingStar()+"별점이 부여됩니다.";
						 } // end of select == null 비교
						 else {
							 result = "이미 채택 된 글입니다.";
						 }  // end of 이미 채택된 글입니다.

				 } // end of 일치 할 때
				 else {
					 result="작성자가 아닙니다.";					 
				 } // end of 일치하지 않을 때
				 

			 } // end of session
			 else {
				 result="세션이 만료되어 로그인이 필요합니다.";
			 }
			 
			 return result;
		 } // ajax로 채택 설정하기
		
		 // 게시글 좋아요 기능 
			@ResponseBody
			@RequestMapping(value="ajaxBoardLike",produces="application/text;charset=UTF-8")
			public String ajaxBoardLike(BoardVO boardVO, HttpSession session) {
				String message = "통신완료";
				
				if(session.getAttribute("loginSession") != null) {					
					CustomerVO customerVO = (CustomerVO) session.getAttribute("loginSession");
					
					String newLikeList = "";
					// 1번글을 모든 사람에게 부여할 거다. -> 환영합니다 이런 글 추가할 예정
					if(boardService.selectBoardLike(customerVO) != null) {
						System.out.println(customerVO.getCustomerID());
						// 게시판 중복 체크 시작
						String[] boardLikeList = ((CustomerVO) boardService.selectBoardLike(customerVO)).getBoardLike().split(",");
						
						int cnt = 0;
						for(String str : boardLikeList) {
							System.out.println(str);
							if(!(boardVO.getBoardID().equals(str))) {
								
								if(cnt==0) {
									newLikeList += str;									
								}
								else {
									newLikeList += ","+str;
								}
								cnt++;
							} // end of equals str
						} // end of for loop boardLikelist
						
						if(!(newLikeList.contains(boardVO.getBoardID()))) {							
							newLikeList += "," + boardVO.getBoardID();						
						}

						System.out.println("newLikeList : "+newLikeList);
						
						// 게시판 중복 체크 종료
						boardVO.setBoardLike(newLikeList);
						boardVO.setCustomerID(customerVO.getCustomerID());
						boardService.insertBoardLike(boardVO);
						
					} // end of if selected == null

					message="해당 게시글을 좋아요 눌렀습니다.";
				} // end of session == null
				else {
					message = "로그인이 필요합니다.";
				} // end of 로그인이 필요합니다
				
				return message;
			} // end of ajaxBoardLike
		 
		 // 오디오 업로드하기
		 @RequestMapping(value="audioUpload.do")
		 public String audioUpload(BoardVO boardVO, HttpSession session, Model m) {
			 String result = "";
			 result="audioTranslate";
			 if(session.getAttribute("loginSession") != null) {				 
				 CustomerVO customerVO = (CustomerVO) session.getAttribute("loginSession");
				 boardVO.setCustomerID(customerVO.getCustomerID());
			 } // end of loginSession
			 else {
				 boardVO.setCustomerID("비회원");
			 } // end of else
			 if(boardVO.getFname() != null) {
				 System.out.println(boardVO.getFname());
				 System.out.println(boardVO.getFsize());
				 boardVO.setBoardType("음성");
				 boardService.imageUpload(boardVO);
				 
				 result="audioTranslate";
				 try {
					TimeUnit.SECONDS.sleep(3);
				 		} catch (InterruptedException e) {
				 				e.printStackTrace();
				} // end of try
				 // 소켓통신 시작
				    // 소켓을 선언한다.
				    try (Socket client = new Socket()) {
				      // 소켓에 접속하기 위한 접속 정보를 선언한다.
				      InetSocketAddress ipep = new InetSocketAddress("127.0.0.1", 10000);
				      // 소켓 접속!
				      client.connect(ipep);
				      // 소켓이 접속이 완료되면 inputstream과 outputstream을 받는다.
				      try (OutputStream sender = client.getOutputStream(); InputStream receiver = client.getInputStream();) {
				        // 메시지는 for 문을 통해 10번 메시지를 전송한다.
				        for (int i = 0; i < 1; i++) {
				          // 전송할 메시지를 작성한다.
				          String msg = "D:\\1_2021_Java_Bigdata\\LJS_workspace\\springwork\\kostep\\src\\main\\webapp\\resources\\upload\\"+boardVO.getFname();
				          // string을 byte배열 형식으로 변환한다.
				          byte[] data = msg.getBytes();
				          // ByteBuffer를 통해 데이터 길이를 byte형식으로 변환한다.
				          ByteBuffer b = ByteBuffer.allocate(4);
				          // byte포멧은 little 엔디언이다.
				          b.order(ByteOrder.LITTLE_ENDIAN);
				          b.putInt(data.length);
				          // 데이터 길이 전송
				          sender.write(b.array(), 0, 4);
				          // 데이터 전송
				          sender.write(data);
				          
				          data = new byte[4];
				          // 데이터 길이를 받는다.
				          receiver.read(data, 0, 4);
				          // ByteBuffer를 통해 little 엔디언 형식으로 데이터 길이를 구한다.
				          ByteBuffer b1 = ByteBuffer.wrap(data);
				          b1.order(ByteOrder.LITTLE_ENDIAN);
				          int length = b1.getInt();
				          // 데이터를 받을 버퍼를 선언한다.
				          data = new byte[length];
				          // 데이터를 받는다.
				          receiver.read(data, 0, length);
				          
				          // byte형식의 데이터를 string형식으로 변환한다.
				          msg = new String(data, "UTF-8");
				          // 콘솔에 출력한다.
				          m.addAttribute("audioTextData",msg);
				          System.out.println(msg);
				        }
				      }
				    } catch (Throwable e) {
				      e.printStackTrace();
				    }
				 // 소켓통신 종료
				 // ==========================================
			 } // end of getFname
			 // ==========================================

			 
			 return result;
		 }


		 // 이미지 업로드하기
		 @RequestMapping(value="imageUpload.do")
		 public String imageUpload(BoardVO boardVO, HttpSession session, Model m) {
			 String result = "";
			 result="doTranslate";
			 if(session.getAttribute("loginSession") != null) {				 
				 CustomerVO customerVO = (CustomerVO) session.getAttribute("loginSession");
				 boardVO.setCustomerID(customerVO.getCustomerID());
			 } // end of loginSession
			 else {
				 boardVO.setCustomerID("비회원");
			 } // end of else
			 if(boardVO.getFname() != null) {
				 System.out.println(boardVO.getFname());
				 System.out.println(boardVO.getFsize());
				 boardVO.setBoardType("이미지");
				 boardService.imageUpload(boardVO);
				 String imageLink = "resources/upload/"+boardVO.getFname();
				 m.addAttribute("imageLink",imageLink);
				 result="doTranslate";
				 try {
					TimeUnit.SECONDS.sleep(3);
				 		} catch (InterruptedException e) {
				 				e.printStackTrace();
				} // end of try
				 // 소켓통신 시작
				    // 소켓을 선언한다.
				    try (Socket client = new Socket()) {
				      // 소켓에 접속하기 위한 접속 정보를 선언한다.
				      InetSocketAddress ipep = new InetSocketAddress("127.0.0.1", 9999);
				      // 소켓 접속!
				      client.connect(ipep);
				      // 소켓이 접속이 완료되면 inputstream과 outputstream을 받는다.
				      try (OutputStream sender = client.getOutputStream(); InputStream receiver = client.getInputStream();) {
				        // 메시지는 for 문을 통해 10번 메시지를 전송한다.
				        for (int i = 0; i < 1; i++) {
				          // 전송할 메시지를 작성한다.
				          String msg = "D:\\1_2021_Java_Bigdata\\LJS_workspace\\springwork\\kostep\\src\\main\\webapp\\resources\\upload\\"+boardVO.getFname();
				          // string을 byte배열 형식으로 변환한다.
				          byte[] data = msg.getBytes();
				          // ByteBuffer를 통해 데이터 길이를 byte형식으로 변환한다.
				          ByteBuffer b = ByteBuffer.allocate(4);
				          // byte포멧은 little 엔디언이다.
				          b.order(ByteOrder.LITTLE_ENDIAN);
				          b.putInt(data.length);
				          // 데이터 길이 전송
				          sender.write(b.array(), 0, 4);
				          // 데이터 전송
				          sender.write(data);
				          
				          data = new byte[4];
				          // 데이터 길이를 받는다.
				          receiver.read(data, 0, 4);
				          // ByteBuffer를 통해 little 엔디언 형식으로 데이터 길이를 구한다.
				          ByteBuffer b1 = ByteBuffer.wrap(data);
				          b1.order(ByteOrder.LITTLE_ENDIAN);
				          int length = b1.getInt();
				          // 데이터를 받을 버퍼를 선언한다.
				          data = new byte[length];
				          // 데이터를 받는다.
				          receiver.read(data, 0, length);
				          
				          // byte형식의 데이터를 string형식으로 변환한다.
				          msg = new String(data, "UTF-8");
				          // 콘솔에 출력한다.
				          m.addAttribute("imageTextData",msg);
				          System.out.println(msg);
				        }
				      }
				    } catch (Throwable e) {
				      e.printStackTrace();
				    }
				 // 소켓통신 종료
				 // ==========================================
			 } // end of getFname
			 // ==========================================

			 
			 return result;
		 } // end of 이미지 업로드하기
		 
} // end of class
	
	
