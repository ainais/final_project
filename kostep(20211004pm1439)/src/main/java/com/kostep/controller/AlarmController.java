package com.kostep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kostep.service.AlarmServiceImpl;

@Controller
public class AlarmController {

	@Autowired
	private AlarmServiceImpl alarmService;
	
	@RequestMapping("alarm.do")
	public String alarm() {
		
		return "alarm";
	}
}
