package com.kostep.domain;

public class CustomerVO {
	// Fields
	private String customerID;
	private String passwd;
	private String name;
	private String gender;
	private String birthday;
	private String phone;
	private String star;
	private String starGrade;
	private String customerClassification;
	private String address;
	private String email;
	private String regDate;
	private String job;
	private String boardLike;
	
	// Constructor
	public CustomerVO() {
		
	}
	
	public CustomerVO(String customerID, String passwd, String name, String gender, String birthday, String phone,
			String star, String starGrade, String customerClassification, String address, String email, String regDate,
			String job, String boardLike) {
		super();
		this.customerID = customerID;
		this.passwd = passwd;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.star = star;
		this.starGrade = starGrade;
		this.customerClassification = customerClassification;
		this.address = address;
		this.email = email;
		this.regDate = regDate;
		this.job = job;
		this.boardLike = boardLike;
	}
	
	// Getter & Setter
	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getStarGrade() {
		return starGrade;
	}

	public void setStarGrade(String starGrade) {
		this.starGrade = starGrade;
	}

	public String getCustomerClassification() {
		return customerClassification;
	}

	public void setCustomerClassification(String customerClassification) {
		this.customerClassification = customerClassification;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(String boardLike) {
		this.boardLike = boardLike;
	}
	
	
}
