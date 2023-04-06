package com.kostep.service;

import java.util.List;

import com.kostep.domain.TextVO;

public interface TextService {

	public void insertChat(TextVO textVO);
	public List<TextVO> selectChat(TextVO textVO);
}
