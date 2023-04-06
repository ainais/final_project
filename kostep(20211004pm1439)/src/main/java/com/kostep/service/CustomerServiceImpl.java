package com.kostep.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kostep.dao.CustomerDAO;
import com.kostep.dao.CustomerDAOImpl;
import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.domain.TextVO;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAOImpl customerDAO;
	
	@Override
	public CustomerVO selectLoginVO(CustomerVO customerVO) {
		return customerDAO.selectLoginVO(customerVO);
	}

	@Override
	public void signup(CustomerVO customerVO) {
		customerDAO.signup(customerVO);
		
	}

	@Override
	public int idCheck(CustomerVO customerVO) throws Exception {
		int result = customerDAO.idCheck(customerVO);
		// TODO Auto-generated method stub
		return result;
	}
	
	// ============================================
	// 마이페이지 시작

	//회원 정보
    @Override
    public List<CustomerVO> customerlist(CustomerVO customerVO) {
	return customerDAO.customerlist(customerVO);
    }
	
    //마이페이지 회원정보 수정 ajax
    @Override
	public void ajaxMypageModify(CustomerVO customerVO) {
    customerDAO.ajaxMypageModify(customerVO);
    }
    //회원 탈퇴
	public void ajaxMypagedelete(CustomerVO customerVO) {
		customerDAO.ajaxMypagedelete(customerVO);
	}
	// 마이페이지 종료
	// ============================================
	// ============================================
	// Myboard 시작
	public List<BoardVO> selectMyboard(CustomerVO customerVO){
		return customerDAO.selectMyboard(customerVO);
	}
	public List<BoardVO> myFreeboardList(CustomerVO customerVO){
		return customerDAO.myFreeboardList(customerVO);
	}
	
	
	public List<TextVO> openChatList(CustomerVO customerVO){
		return customerDAO.openChatList(customerVO);
	}
	public List<BoardVO> selectLikeBoard(String str){
		return customerDAO.selectLikeBoard(str);
	}
	
	// Myboard 종료
	// ============================================
}
