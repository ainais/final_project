package com.kostep.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kostep.domain.TextVO;

@Repository("textDAO")
public class TextDAOImpl implements TextDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertChat(TextVO textVO) {
		mybatis.insert("text.insertChat",textVO);
	}
	
	public List<TextVO> selectChat(TextVO textVO) {
		return mybatis.selectList("text.selectChat",textVO);
	}
}
