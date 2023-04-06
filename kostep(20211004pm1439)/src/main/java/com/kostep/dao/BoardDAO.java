package com.kostep.dao;

import java.util.List;


import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.domain.PagingVO;
import com.kostep.domain.ReplyVO;



public interface BoardDAO {
	// 답글 수정하기
	public void ajaxReplyUpdate(ReplyVO replyVO);
	
	// 게시판 좋아요 기능 추가
	public CustomerVO selectBoardLike(CustomerVO customerVO);
	
	public void insertBoardLike(BoardVO boardVO);
	
	// 게시판 목록 보기
	public List<BoardVO> getList(BoardVO boardVO);
	public BoardVO selectCheck(BoardVO boardVO);
	
	// 별 받아오기 및 목록 불러오기
	public BoardVO starSelect(BoardVO boardVO);
	public ReplyVO addStar(ReplyVO replyVO);
	
	// 게시글 작성
	public int insertBoard(BoardVO boardVO);
	
	// 답글 목록 불러오기
	public List<ReplyVO> readReply(BoardVO boardVO);
	
	// 답글 작성
	public void replyInsert(BoardVO boardVO);
	
	// 게시글 상세보기
	public BoardVO boardlists(BoardVO boardVO);
	
	// 게시글 삭제하기
	public void deleteBoard(BoardVO boardVO);
	
	// 게시판 보기 + 페이징 
	public List<BoardVO> selectBoard(PagingVO vo);

	// 페이징 게시글 수
	public int countBoard(PagingVO vo);
	
	// 게시글 수정
	public void updateBoard(BoardVO boardVO);
	
	// 조회수 증가
	public void updateboardCount(BoardVO boardVO);
	
	// 이미지 업로드
	public void	imageUpload(BoardVO boardVO);
	
	// postingStar시 보유중인 star빼기
	public void minusStar(BoardVO boardVO);
}
