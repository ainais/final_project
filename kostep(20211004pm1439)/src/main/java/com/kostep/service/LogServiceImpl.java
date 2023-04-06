package com.kostep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kostep.dao.LogDAO;
import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;

@Service("logService")
public class LogServiceImpl implements LogService {

	@Autowired
	private LogDAO logDAO;
	
	// star 랭킹 리스트 가져오기
	public List<CustomerVO> selectRankingList() {
		
		return logDAO.selectRankingList();
	}
	// star 랭킹 리스트 가져오기
	public List<BoardVO> boardHotList() {
		
		return logDAO.boardHotList();
	}
	
	
	// 전체 보드 갯수
	public int totalBoardCount() {
		return logDAO.totalBoardCount();
	}
	public int totalReplyCount() {
		return logDAO.totalReplyCount();
	}
	public int totalTodayCount() {
		return logDAO.totalTodayCount();
	}
	public int totalWeekCount() {
		return logDAO.totalWeekCount();
	}
}
