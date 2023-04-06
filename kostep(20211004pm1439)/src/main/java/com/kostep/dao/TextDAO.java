package com.kostep.dao;

import java.util.List;

import com.kostep.domain.TextVO;

public interface TextDAO {

	public void insertChat(TextVO textVO);
	public List<TextVO> selectChat(TextVO textVO);
}
