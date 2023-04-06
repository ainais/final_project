package com.kostep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kostep.dao.TextDAOImpl;
import com.kostep.domain.TextVO;

@Service("textService")
public class TextServiceImpl implements TextService {

	@Autowired
	private TextDAOImpl textDAO;
	
	public void insertChat(TextVO textVO) {
		textDAO.insertChat(textVO);
	}
	
	public List<TextVO> selectChat(TextVO textVO) {
		return textDAO.selectChat(textVO);
	}
}
