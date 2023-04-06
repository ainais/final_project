package com.kostep.service;

import java.util.List;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;

public interface LogService {

	// star 랭킹 리스트 가져오기
	public List<CustomerVO> selectRankingList();
	public List<BoardVO> boardHotList();
	
	// 전체 보드 갯수
	public int totalBoardCount();
	public int totalReplyCount();
	public int totalTodayCount();
	public int totalWeekCount();
	
	
}
