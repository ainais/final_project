package com.kostep.domain;

public class TextVO {
	// Fields
	private String textID;
	private String customerID;
	private String customerSecret;
	private String textContent;
	private String textDate;
	
	// Constructor
	public TextVO() {
		
	}
	
	public TextVO(String textID, String customerID, String customerSecret, String textContent, String textDate) {
		super();
		this.textID = textID;
		this.customerID = customerID;
		this.customerSecret = customerSecret;
		this.textContent = textContent;
		this.textDate = textDate;
	}
	
	// Getter & Setter
	public String getTextID() {
		return textID;
	}

	public void setTextID(String textID) {
		this.textID = textID;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getCustomerSecret() {
		return customerSecret;
	}

	public void setCustomerSecret(String customerSecret) {
		this.customerSecret = customerSecret;
	}

	public String getTextContent() {
		return textContent;
	}

	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}

	public String getTextDate() {
		return textDate;
	}

	public void setTextDate(String textDate) {
		this.textDate = textDate;
	}
	
}
