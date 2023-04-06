package com.kostep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kostep.dao.BoardDAO;
import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.domain.PagingVO;
import com.kostep.domain.ReplyVO;




@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	// 답글 수정하기
	public void ajaxReplyUpdate(ReplyVO replyVO) {
		boardDAO.ajaxReplyUpdate(replyVO);
	}
	
	// 게시판 좋아요 기능 추가
	public CustomerVO selectBoardLike(CustomerVO customerVO) {
		
		return boardDAO.selectBoardLike(customerVO);
	}
	public BoardVO selectCheck(BoardVO boardVO) {
		
		return boardDAO.selectCheck(boardVO);
	}
	public void insertBoardLike(BoardVO boardVO) {
		boardDAO.insertBoardLike(boardVO);
	}
	// 별 받아오기 및 목록 불러오기
	public BoardVO starSelect(BoardVO boardVO) {
		
		return boardDAO.starSelect(boardVO);
	}
	
	public ReplyVO addStar(ReplyVO replyVO) {
		return boardDAO.addStar(replyVO);
	}
	
	@Override
	public int countBoard(PagingVO vo) {
		return boardDAO.countBoard(vo);
	}

	// 게시판 보기 + 페이징
	@Override
	public List<BoardVO> selectBoard(PagingVO vo) {
		return boardDAO.selectBoard(vo);
	}
	
	//
	@Override
	public List<BoardVO> getList(BoardVO boardVO) {
		
		return boardDAO.getList(boardVO);
	}
	//게시판 글쓰기
	public int insertBoard(BoardVO boardVO) {
		return boardDAO.insertBoard(boardVO);
		}
	// 답글작성
	public void replyInsert(BoardVO boardVO) {
		boardDAO.replyInsert(boardVO);
		}
	//게시글 상세보기
	public BoardVO boardlists(BoardVO boardVO) {
		return boardDAO.boardlists(boardVO);
		}
	//수정하기
	public void updateBoard(BoardVO boardVO) {
		boardDAO.updateBoard(boardVO);
		}
	//삭제하기
	public void deleteBoard(BoardVO boardVO) {
		boardDAO.deleteBoard(boardVO);
		}
	//게시글 조회수 증가
	public void updateboardCount(BoardVO boardVO) {
		boardDAO.updateboardCount(boardVO);
	}
	
	// 답글 목록 불러오기
	public List<ReplyVO> readReply(BoardVO boardVO){
		return boardDAO.readReply(boardVO);
	}
	
	// 이미지 업로드 데이터 입력하기
	public void imageUpload(BoardVO boardVO) {
		boardDAO.imageUpload(boardVO);
	}
	
	// postingStar시 보유중인 star빼기
	public void minusStar(BoardVO boardVO) {
		boardDAO.minusStar(boardVO);
	}
}
