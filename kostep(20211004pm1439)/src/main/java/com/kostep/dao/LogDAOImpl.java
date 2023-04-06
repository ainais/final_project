package com.kostep.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;

@Repository
public class LogDAOImpl implements LogDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CustomerVO> selectRankingList() {
		return mybatis.selectList("log.selectRankingList");
	}
	public List<BoardVO> boardHotList() {
		return mybatis.selectList("log.boardHotList");
	}
	
	// 전체 보드 갯수
	public int totalBoardCount() {
		return mybatis.selectOne("log.totalBoardCount");
	}
	public int totalReplyCount() {
		return mybatis.selectOne("log.totalReplyCount");
	}
	public int totalTodayCount() {
		return mybatis.selectOne("log.totalTodayCount");
	}
	public int totalWeekCount() {
		return mybatis.selectOne("log.totalWeekCount");
	}
}
