package com.kostep.service;

import java.util.List;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.domain.PagingVO;
import com.kostep.domain.ReplyVO;



public interface BoardService {
	// 답글 수정하기
	public void ajaxReplyUpdate(ReplyVO replyVO);
	
	// 게시판 좋아요 기능 추가
	public CustomerVO selectBoardLike(CustomerVO customerVO);
	
	// 별 받아오기 및 목록 불러오기
	public BoardVO starSelect(BoardVO boardVO);
	public ReplyVO addStar(ReplyVO replyVO);
	
	public void insertBoardLike(BoardVO boardVO);
	// 게시글 목록 보기
	List<BoardVO> getList(BoardVO boardVO);
	// 게시글 작성
	int insertBoard(BoardVO boardVO);
	// 게시글 상세 보기
	BoardVO boardlists(BoardVO boardVO);
	public BoardVO selectCheck(BoardVO boardVO);
	
	// 글 삭제
    void deleteBoard(BoardVO boardVO);
    
    // 답글 작성
    public void replyInsert(BoardVO boardVO);
	
	// 페이징 게시글 조회
	List<BoardVO> selectBoard(PagingVO vo);
	
	// 게시글 수정
	public void updateBoard(BoardVO boardVO);
	
	// 조회수증가
	public void updateboardCount(BoardVO boardVO);
	
	public int countBoard(PagingVO vo);
	// 답글 불러오기
	public List<ReplyVO> readReply(BoardVO boardVO);
	
	// 이미지 업로드 데이터 입력하기
	public void imageUpload(BoardVO boardVO);
	
	// postingStar시 보유중인 star빼기
	public void minusStar(BoardVO boardVO);
}
