package com.kostep.dao;

import java.util.List;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.domain.TextVO;

public interface CustomerDAO {

	//로그인
	public CustomerVO selectLoginVO(CustomerVO customerVO);	
	
	//회원가입
	public void signup(CustomerVO customerVO);
	
	//ID 중복체크
	public int idCheck(CustomerVO customerVO) throws Exception;
	
	// ========================================
	// 마이페이지 시작

	//회원 목록
	public List<CustomerVO> customerlist(CustomerVO customerVO);
    
	//마이페이지 회원정보 수정 ajax
	public void ajaxMypageModify(CustomerVO customerVO);
	
    //회원 탈퇴
	public void ajaxMypagedelete(CustomerVO customerVO);
	
	// 마이페이지 종료
	// ========================================
	// ============================================
	// Myboard 시작
	public List<BoardVO> selectMyboard(CustomerVO customerVO);
	public List<BoardVO> myFreeboardList(CustomerVO customerVO);
	public List<TextVO> openChatList(CustomerVO customerVO);
	public List<BoardVO> selectLikeBoard(String str);
	// Myboard 종료
	// ============================================
}

