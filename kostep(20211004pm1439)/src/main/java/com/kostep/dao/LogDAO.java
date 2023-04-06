package com.kostep.dao;

import java.util.List;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;

public interface LogDAO {

	public List<CustomerVO> selectRankingList();
	public List<BoardVO> boardHotList();
	// 전체 보드 갯수
	public int totalBoardCount();
	public int totalReplyCount();
	public int totalTodayCount();
	public int totalWeekCount();
}
