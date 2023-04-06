package com.kostep.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.domain.TextVO;

public interface CustomerService {
	
	//로그인 리스트 불러오기
	public CustomerVO selectLoginVO(CustomerVO customerVO);

	//회원가입
	public void signup(CustomerVO customerVO);

	//id 중복체크
	public int idCheck(CustomerVO customerVO) throws Exception;
	
	// ============================================
	// 마이페이지 시작

	//회원 정보
    public List<CustomerVO> customerlist(CustomerVO customerVO);
	
    //마이페이지 회원정보 수정 ajax
	public void ajaxMypageModify(CustomerVO customerVO);
	
    //회원 탈퇴
	public void ajaxMypagedelete(CustomerVO customerVO);
	
	// 마이페이지 종료
	// ============================================
	
	// ============================================
	// Myboard 시작
	public List<BoardVO> selectMyboard(CustomerVO customerVO);
	public List<BoardVO> myFreeboardList(CustomerVO customerVO);
	public List<TextVO> openChatList(CustomerVO customerVO);
	
	public List<BoardVO> selectLikeBoard(String str);
	// Myboard 종료
	// ============================================
}
