package com.kostep.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kostep.domain.TextVO;
import com.kostep.service.TextServiceImpl;

@Controller
public class TextController {

	@Autowired
	private TextServiceImpl textService;
	
	@RequestMapping(value="openChat")
	public String openChat(Model m) {
		String returnPage = "openChat";
		
		TextVO textVO = new TextVO();
		List<TextVO> chatList = textService.selectChat(textVO);
		m.addAttribute("openChatList",chatList);
		return returnPage;
		
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxText",produces="application/text;charset=UTF-8")
	public String ajaxText(TextVO textVO, HttpSession session) {
		//============================
		// 작성자에 대한 부분 시작
		if(session.getAttribute("loginSession") == null) {
			textVO.setCustomerID("비회원");
		}
		// 작성자에 대한 부분 종료
		//============================
				
		//============================
		// 작성일 시작
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String stringTime = format.format(time);
		textVO.setTextDate(stringTime);
		// 작성일 종료
		//============================
		textService.insertChat(textVO);
		String message = textVO.getTextDate()+" "+textVO.getCustomerID()+" >> "+textVO.getTextContent();
		System.out.println(message);
		return message;
	} // end of 
}
