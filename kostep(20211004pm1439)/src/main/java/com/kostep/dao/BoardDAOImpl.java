package com.kostep.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kostep.domain.BoardVO;
import com.kostep.domain.CustomerVO;
import com.kostep.domain.PagingVO;
import com.kostep.domain.ReplyVO;




@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	// 답글 수정하기
	public void ajaxReplyUpdate(ReplyVO replyVO) {
		mybatis.update("board.ajaxReplyUpdate",replyVO);
	}
	
	// 게시판 좋아요 기능 추가
	public CustomerVO selectBoardLike(CustomerVO customerVO) {
		System.out.println("==========selectBoardLike()");
		return mybatis.selectOne("board.selectBoardLike",customerVO);
	}
	
	public void insertBoardLike(BoardVO boardVO) {
		System.out.println("==========insertBoardLike()");
		mybatis.update("board.insertBoardLike",boardVO);
	}
	// 별 받아오기 및 목록 불러오기
	public BoardVO starSelect(BoardVO boardVO) {
		System.out.println("==========starSelect()");
		BoardVO DBBoardVO = (BoardVO) mybatis.selectOne("board.starSelect",boardVO);
		mybatis.update("board.starUpdate",boardVO);
		return DBBoardVO;
	}
	public BoardVO selectCheck(BoardVO boardVO) {
		return mybatis.selectOne("board.selectCheck",boardVO);
	}
	
	public ReplyVO addStar(ReplyVO replyVO) {
		System.out.println("==========addStar()");
		mybatis.update("board.addStar",replyVO);
		mybatis.update("board.plusCustomerStar",replyVO);
		return mybatis.selectOne("board.starReply",replyVO);
	}
	
	// 게시글 목록 보기
	@Override
	public List<BoardVO> getList(BoardVO boardVO) {
		
		System.out.println("==========free board get List()");
		return mybatis.selectList("board.getList", boardVO);
		
		//mapper의 namespace가 board, id = getList 인 것 반환하라
	}
	
	// 답글 목록 보기
	@Override
	public List<ReplyVO> readReply(BoardVO boardVO) {
		
		System.out.println("==========free board get List()");
		return mybatis.selectList("board.replyList", boardVO);
		
		//mapper의 namespace가 board, id = getList 인 것 반환하라
	}
	
	@Override
	  public void replyInsert(BoardVO boardVO) {
	  System.out.println("==========> replyInsert()");
	  mybatis.insert("board.replyInsert", boardVO); 
	  }
	
	// 답글작성
	  public int insertBoard(BoardVO boardVO) {
	  System.out.println("==========> free board insert()");
	  return mybatis.insert("board.insertBoard", boardVO); 
	  }
	 public BoardVO boardlists(BoardVO boardVO) {
			System.out.println("===> Mybatis boardlists() 호출");
			return mybatis.selectOne("board.boardlists", boardVO);
		}
	 
	 public void deleteBoard(BoardVO boardVO) {
			System.out.println("===> Mybatis deleteboard() 호출");
			mybatis.delete("board.deleteBoard", boardVO);
		}
	 
	// 게시글 보기 + 페이징
	@Override
	public List<BoardVO> selectBoard(PagingVO vo) {
		System.out.println("===> Mybatis selectBoard() 호출");
		return mybatis.selectList("board.selectBoard", vo);
	}
	@Override
	public int countBoard(PagingVO vo) {
		System.out.println("===> Mybatis countBoard() 호출");
		return mybatis.selectOne("board.countBoard",vo);
	}
	    
	 //게시글 수정하기
	 public void updateBoard(BoardVO boardVO) {
			System.out.println("===> Mybatis updateBoard() 호출");
			mybatis.update("board.updateBoard", boardVO);
		}
	// 조회수 증가
	@Override
    public void updateboardCount(BoardVO boardVO) {
        mybatis.update("board.updateboardCount", boardVO);
    }
	// 이미지 업로드 데이터 입력하기
	public void	imageUpload(BoardVO boardVO) {
		System.out.println(boardVO.getBoardType()+"===> Mybatis fileUpload() 호출");
		mybatis.insert("board.imageUpload",boardVO);
	}
	// postingStar시 보유중인 star빼기
	public void minusStar(BoardVO boardVO) {
		mybatis.update("board.minusStar",boardVO);
	}
}
