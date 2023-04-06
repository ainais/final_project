package com.kostep.domain;

public class AlarmVO {
	// Fields
	private String alarmID;
	private String customerID;
	private String sendCustomerID;
	private String boardID;
	private String alarmTitle;
	private String alarmContent;
	private String alarmDate;
	private String alarmCheck;
	
	// Constructor
	public AlarmVO() {
		
	}
	
	public AlarmVO(String alarmID, String customerID, String sendCustomerID, String boardID, String alarmTitle,
			String alarmContent, String alarmDate, String alarmCheck) {
		super();
		this.alarmID = alarmID;
		this.customerID = customerID;
		this.sendCustomerID = sendCustomerID;
		this.boardID = boardID;
		this.alarmTitle = alarmTitle;
		this.alarmContent = alarmContent;
		this.alarmDate = alarmDate;
		this.alarmCheck = alarmCheck;
	}
	
	// Getter & Setter
	public String getAlarmID() {
		return alarmID;
	}
	public void setAlarmID(String alarmID) {
		this.alarmID = alarmID;
	}
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	public String getSendCustomerID() {
		return sendCustomerID;
	}
	public void setSendCustomerID(String sendCustomerID) {
		this.sendCustomerID = sendCustomerID;
	}
	public String getBoardID() {
		return boardID;
	}
	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}
	public String getAlarmTitle() {
		return alarmTitle;
	}
	public void setAlarmTitle(String alarmTitle) {
		this.alarmTitle = alarmTitle;
	}
	public String getAlarmContent() {
		return alarmContent;
	}
	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}
	public String getAlarmDate() {
		return alarmDate;
	}
	public void setAlarmDate(String alarmDate) {
		this.alarmDate = alarmDate;
	}
	public String getAlarmCheck() {
		return alarmCheck;
	}
	public void setAlarmCheck(String alarmCheck) {
		this.alarmCheck = alarmCheck;
	}
	
	
}
