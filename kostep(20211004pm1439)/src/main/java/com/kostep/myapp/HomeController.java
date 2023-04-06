package com.kostep.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	// whole menu bar
	@RequestMapping("about")
	public String about() {

		return "about";
	}

	// translate 내 page 소 분류
	@RequestMapping("translate")
	public String translate() {

		return "translate";
	}

	@RequestMapping("textService")
	public String textService() {

		return "textService";
	}

	@RequestMapping("imgService")
	public String imgService() {

		return "imgService";
	}

	@RequestMapping("voiceService")
	public String voiceService() {

		return "voiceService";
	}

	// community 내 자유게시판 / 오픈 채팅방 / 소개 소 분류
	@RequestMapping("community")
	public String community() {

		return "community";
	}

//	@RequestMapping("freeboard")
//	public String freeboard() {
//
//		return "freeboard";
//	}
	// free board 내 게시판 CRUD
	
	//free board 게시글 등록 페이지 매핑
	@RequestMapping(value="create")
	public String create() {
		return "create";
	}


	@RequestMapping("boardInfo")
	public String boardInfo() {

		return "boardInfo";
	}

	// Contact 내 contact / faq
	@RequestMapping("contact")
	public String contact() {

		return "contact";
	}

	@RequestMapping("faq")
	public String faq() {

		return "faq";
	}

	@RequestMapping("mypage")
	public String mypage() {

		return "mypage";
	}



	// 관리자 session : admin 일 때 로고 바뀌면서 접속 => 연결 확인

	@RequestMapping("adminIndex")
	public String adminIndex() {

		return "adminIndex";
	}



	@RequestMapping("signup")
	public String signup() {

		return "signup";
	}
}
