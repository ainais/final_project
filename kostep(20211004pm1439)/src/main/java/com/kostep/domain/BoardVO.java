package com.kostep.domain;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	// Fields
	private String boardID;
	private String customerID;
	private String language;
	private String boardType;
	private String postingStar;
	private String boardContent;
	private String fname;
	private String fsize;
	private String uploadDate;
	private String boardSelect;
	private String boardTitle;
	private String boardCount;
	private String boardLike;
	private String boardSecret;
	private String boardClassification;
	
	// Constructor
	public BoardVO() {
		
	}
	
	public BoardVO(String boardID, String customerID, String language, String boardType, String postingStar,
			String boardContent, String fname, String fsize, String uploadDate, String boardSelect, String boardTitle,
			String boardCount, String boardLike, String boardSecret, String boardClassification) {
		super();
		this.boardID = boardID;
		this.customerID = customerID;
		this.language = language;
		this.boardType = boardType;
		this.postingStar = postingStar;
		this.boardContent = boardContent;
		this.fname = fname;
		this.fsize = fsize;
		this.uploadDate = uploadDate;
		this.boardSelect = boardSelect;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.boardLike = boardLike;
		this.boardSecret = boardSecret;
		this.boardClassification = boardClassification;
	}
	// ===========================
	// 파일첨부 시작
	MultipartFile file;	// write.jsp에 파일첨부시 name="file"과 동일한 변수명
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		// 업로드 파일 접근
		if(! file.isEmpty()){
			this.fname = file.getOriginalFilename();
			this.fsize = Integer.toString((int)file.getSize());
			
			//***********************************************
			// 해당 경로로 변경
			File f = new File("D:\\1_2021_Java_Bigdata\\LJS_workspace\\springwork\\kostep\\src\\main\\webapp\\resources\\upload\\"+fname);
			
			try {file.transferTo(f);	} 
			catch (IllegalStateException e) {e.printStackTrace();} 
			catch (IOException e) {e.printStackTrace();}
		} // end of if
	} // end of setFile
	// 파일첨부 종료
	// ===========================
	// Getter & Setter
	public String getBoardID() {
		return boardID;
	}

	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getPostingStar() {
		return postingStar;
	}

	public void setPostingStar(String postingStar) {
		this.postingStar = postingStar;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFsize() {
		return fsize;
	}

	public void setFsize(String fsize) {
		this.fsize = fsize;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getBoardSelect() {
		return boardSelect;
	}

	public void setBoardSelect(String boardSelect) {
		this.boardSelect = boardSelect;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(String boardCount) {
		this.boardCount = boardCount;
	}

	public String getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(String boardLike) {
		this.boardLike = boardLike;
	}

	public String getBoardSecret() {
		return boardSecret;
	}

	public void setBoardSecret(String boardSecret) {
		this.boardSecret = boardSecret;
	}

	public String getBoardClassification() {
		return boardClassification;
	}

	public void setBoardClassification(String boardClassification) {
		this.boardClassification = boardClassification;
	}

	
}
