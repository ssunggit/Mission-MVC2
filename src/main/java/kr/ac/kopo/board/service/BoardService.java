package kr.ac.kopo.board.service;

import java.util.List;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardService {
	
	private BoardDAO boardDao;

	public BoardService(BoardDAO boardDao) {
		// boardDao 에 의존성을 갖고 있다 -> DI
		this.boardDao = boardDao;
	}

	/**
	 * 전체 게시글 조회
	 */
	public List<BoardVO> selectAllboard() {
		List<BoardVO> boardList = boardDao.selectAll();
		return boardList;
	}
	
	/**
	 * 게시글 등록
	 */
	public void addBoard(BoardVO board) {
		int no = boardDao.selectBoardNo();
		board.setNo(no);
		boardDao.insertBoard(board);
		
	}
	
	/**
	 * 게시글상세
	 */
	public BoardVO selectBoardByNo(int no) {
		return boardDao.selectByNo(no);
	}
	
}
