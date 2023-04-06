package com.kostep.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.domain.TextVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 로그인
	public CustomerVO selectLoginVO(CustomerVO customerVO) {
		return mybatis.selectOne("customer.selectLoginVO",customerVO);
	}

	// 회원가입
	public void signup(CustomerVO customerVO) {
		mybatis.insert("customer.signup",customerVO);
		
	}
	// id 중복체크
	@Override
	public int idCheck(CustomerVO customerVO) throws Exception {
		int result = mybatis.selectOne("customer.idCheck", customerVO);
	 	return result;
	}
	// ========================================
	// 마이페이지 시작

	//회원 목록
	@Override
	public List<CustomerVO> customerlist(CustomerVO customerVO) {
	System.out.println("===> customer의 customerlist() 호출");
	return mybatis.selectList("customer.customerlist", customerVO);
	}
    
	//마이페이지 회원정보 수정 ajax
	public void ajaxMypageModify(CustomerVO customerVO) {
		System.out.println("==> customer의 ajaxMypageModify 호출");
		mybatis.update("customer.ajaxMypageModify", customerVO);
	}
    //회원 탈퇴
	@Override
	public void ajaxMypagedelete(CustomerVO customerVO) {
	System.out.println("==>customer의 ajaxMypagedelete 호출");    
    mybatis.delete("customer.ajaxMypagedelete",customerVO);
	}
	
	// 마이페이지 종료
	// ========================================
	// ============================================
	// Myboard 시작
	public List<BoardVO> selectMyboard(CustomerVO customerVO){
		return mybatis.selectList("customer.selectMyboard",customerVO);
	}
	public List<BoardVO> myFreeboardList(CustomerVO customerVO){
		return mybatis.selectList("customer.myFreeboardList",customerVO);
	}
	public List<TextVO> openChatList(CustomerVO customerVO){
		return mybatis.selectList("customer.openChatList",customerVO);
	}
	public List<BoardVO> selectLikeBoard(String str){
		return mybatis.selectList("customer.selectLikeBoard",str);
	}
	// Myboard 종료
	// ============================================
}
