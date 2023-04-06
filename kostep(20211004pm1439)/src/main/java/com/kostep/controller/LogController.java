package com.kostep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kostep.domain.BoardVO;
import com.kostep.service.LogServiceImpl;


@Controller
public class LogController {

	@Autowired
	private LogServiceImpl logService;
	@RequestMapping("index")
	public String index(Model m) {
		System.out.println("인덱스 실행");
		m.addAttribute("rankList",logService.selectRankingList());
		m.addAttribute("totalBoardCount",logService.totalBoardCount());
		m.addAttribute("totalReplyCount",logService.totalReplyCount());
		m.addAttribute("totalTodayCount",logService.totalTodayCount());
		m.addAttribute("totalWeekCount",logService.totalWeekCount());
		
		List<BoardVO> boardHotList = logService.boardHotList();
		
		for(BoardVO vo : boardHotList) {
			System.out.println(vo.getBoardID());
		}
		m.addAttribute("boardHotList",logService.boardHotList());
		
		
		return "index";
	} // index 페이지 요청
	
	@RequestMapping("index.do")
	public String indexDo(Model m) {
		System.out.println("인덱스 do 실행");
		m.addAttribute("rankList",logService.selectRankingList());
		m.addAttribute("totalBoardCount",logService.totalBoardCount());
		m.addAttribute("totalReplyCount",logService.totalReplyCount());
		m.addAttribute("totalTodayCount",logService.totalTodayCount());
		
		List<BoardVO> boardHotList = logService.boardHotList();
		
		for(BoardVO vo : boardHotList) {
			System.out.println(vo.getBoardID());
			System.out.println(vo.getBoardCount());
			System.out.println(vo.getBoardContent());
		}
		m.addAttribute("boardHotList",logService.boardHotList());
		
		return "index";
	} // index 페이지 요청
}
