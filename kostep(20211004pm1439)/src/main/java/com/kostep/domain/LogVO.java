package com.kostep.domain;

public class LogVO {
	// Fields
	private String sessionID;
	private String sessionRegDate;
	private String sessionExpireDate;
	private String visitPage;
	private String typingCount;
	private String customerID;
	
	// Constructor
	public LogVO() {
		
	}
	
	public LogVO(String sessionID, String sessionRegDate, String sessionExpireDate, String visitPage,
			String typingCount, String customerID) {
		super();
		this.sessionID = sessionID;
		this.sessionRegDate = sessionRegDate;
		this.sessionExpireDate = sessionExpireDate;
		this.visitPage = visitPage;
		this.typingCount = typingCount;
		this.customerID = customerID;
	}
	
	// Getter & Setter
	public String getSessionID() {
		return sessionID;
	}
	public void setSessionID(String sessionID) {
		this.sessionID = sessionID;
	}
	public String getSessionRegDate() {
		return sessionRegDate;
	}
	public void setSessionRegDate(String sessionRegDate) {
		this.sessionRegDate = sessionRegDate;
	}
	public String getSessionExpireDate() {
		return sessionExpireDate;
	}
	public void setSessionExpireDate(String sessionExpireDate) {
		this.sessionExpireDate = sessionExpireDate;
	}
	public String getVisitPage() {
		return visitPage;
	}
	public void setVisitPage(String visitPage) {
		this.visitPage = visitPage;
	}
	public String getTypingCount() {
		return typingCount;
	}
	public void setTypingCount(String typingCount) {
		this.typingCount = typingCount;
	}
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	
	
	
}
