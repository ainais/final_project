package com.kostep.domain;

public class ReplyVO {

	private String customerID;
	private String replyID;
	private String boardID;
	private String replyContent;
	private String replyRegdate;
	private String boardSelect;
	
	public ReplyVO() {
		
	}
	
	public ReplyVO(String customerID, String replyID, String boardID, String replyContent, String replyRegdate,
			String boardSelect) {
		super();
		this.customerID = customerID;
		this.replyID = replyID;
		this.boardID = boardID;
		this.replyContent = replyContent;
		this.replyRegdate = replyRegdate;
		this.boardSelect = boardSelect;
	}
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	public String getReplyID() {
		return replyID;
	}
	public void setReplyID(String replyID) {
		this.replyID = replyID;
	}
	public String getBoardID() {
		return boardID;
	}
	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(String replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	public String getBoardSelect() {
		return boardSelect;
	}
	public void setBoardSelect(String boardSelect) {
		this.boardSelect = boardSelect;
	}
	
	
}
